import json

from db import db, User, Service
from flask import Flask, request

app = Flask(__name__)
db_filename = "quotas.db"

app.config["SQLALCHEMY_DATABASE_URI"] = "sqlite:///%s" % db_filename
app.config["SQLALCHEMY_TRACK_MODIFICATIONS"] = False
app.config["SQLALCHEMY_ECHO"] = True

db.init_app(app)
with app.app_context():
    db.create_all()


def success_response(body, code=200):
    """
    Abstraction for a success response
    """
    return json.dumps(body), code


def failure_response(message, code=404):
    """
    Abstraction for a failure response
    """
    return json.dumps({"error": message}), code


# Routes


# Users
@app.route("/")
@app.route("/api/users/")
def get_all_users():
    """
    Endpoint for getting all users
    """
    users = []
    for user in User.query.all():
        users.append(user.serialize())
    return success_response({"users": users})


@app.route("/api/users/<int:user_id>/")
def get_a_user(user_id):
    """
    Endpoint for getting a user by id
    """
    user = User.query.filter_by(id=user_id).first()
    if user is None:
        return failure_response("User not found")
    return success_response(user.serialize())


@app.route("/api/users/", methods=["POST"])
def create_a_user():
    """
    Endpoint for creating a user
    """
    body = json.loads(request.data)
    user_username = body.get("username")
    user_quotas_left = body.get("quotas_left")
    user_profile_picture = body.get("profile_picture_url")
    if (
        user_username is None
        or user_quotas_left is None
        or user_profile_picture is None
    ):
        return failure_response("Invalid fields provided", 400)
    new_user = User(
        username=user_username,
        quotas_left=user_quotas_left,
        profile_picture=user_profile_picture,
    )
    db.session.add(new_user)
    db.session.commit()
    return success_response(new_user.serialize(), 201)


@app.route("/api/users/<int:user_id>/", methods=["POST"])
def update_a_user(user_id):
    """
    Endpoint for updating a user
    """
    body = json.loads(request.data)
    user_username = body.get("username")
    user_quotas_left = body.get("quotas_left")
    if user_username is None or user_quotas_left is None:
        return failure_response("Invalid fields provided", 400)
    user = User.query.filter_by(id=user_id).first()
    if user is None:
        return failure_response("User not found")
    user.username = user_username
    user.quotas_left = user_quotas_left
    db.session.commit()
    return success_response(user.serialize())


@app.route("/api/users/<int:user_id>/", methods=["DELETE"])
def delete_a_user(user_id):
    """
    Endpoint for deleting a user by id
    """
    user = User.query.filter_by(id=user_id).first()
    if user is None:
        return failure_response("User not found")
    db.session.delete(user)
    db.session.commit()
    return success_response(user.serialize())


# Services


@app.route("/api/services/")
def get_all_services():
    """
    Endpoint for getting all services
    """
    services = []
    for service in Service.query.all():
        services.append(service.serialize_basic_info())
    return success_response({"services": services})


@app.route("/api/services/<int:service_id>/")
def get_a_service(service_id):
    """
    Endpoint for getting a service by id
    """
    service = Service.query.filter_by(id=service_id).first()
    if service is None:
        return failure_response("Service not found")
    return success_response(service.serialize_basic_info())


@app.route("/api/services/", methods=["POST"])
def create_a_service():
    """
    Endpoint for creating a service
    """
    body = json.loads(request.data)
    service_name = body.get("name")
    service_description = body.get("description")
    service_popularity = body.get("popularity")
    service_cost = body.get("cost")
    service_image_url = body.get("image_url")
    if (
        service_name is None
        or service_description is None
        or service_popularity is None
        or service_cost is None
        or service_image_url is None
    ):
        return failure_response("Invalid fields provided", 400)
    new_service = Service(
        name=service_name,
        description=service_description,
        popularity=service_popularity,
        cost=service_cost,
        image_url=service_image_url,
    )
    db.session.add(new_service)
    db.session.commit()
    return success_response(new_service.serialize(), 201)


@app.route("/api/services/<int:service_id>/", methods=["POST"])
def update_a_service(service_id):
    """
    Endpoint for updating a service
    """
    body = json.loads(request.data)
    service_name = body.get("name")
    service_description = body.get("description")
    service_popularity = body.get("popularity")
    service_cost = body.get("cost")
    service_image_url = body.get("image_url")
    if (
        service_name is None
        or service_description is None
        or service_popularity is None
        or service_cost is None
        or service_image_url is None
    ):
        return failure_response("Invalid fields provided", 400)
    service = Service.query.filter_by(id=service_id).first()
    if service is None:
        return failure_response("Service not found")
    service.name = service_name
    service.description = service_description
    service.popularity = service_popularity
    service.cost = service_cost
    service.image_url = service_image_url
    db.session.commit()
    return success_response(service.serialize())


@app.route("/api/services/<int:service_id>/", methods=["DELETE"])
def delete_a_service(service_id):
    """
    Endpoint for deleting a service by id
    """
    service = Service.query.filter_by(id=service_id).first()
    if service is None:
        return failure_response("Service not found")
    db.session.delete(service)
    db.session.commit()
    return success_response(service.serialize())


@app.route("/api/users/<int:user_id>/service/<int:service_id>/", methods=["POST"])
def user_requests_service(user_id, service_id):
    """
    Endpoint for a user requesting a service
    """
    user = User.query.filter_by(id=user_id).first()
    service = Service.query.filter_by(id=service_id).first()
    if user is None or service is None:
        return failure_response("User or service not found")
    current_balance = user.quotas_left
    service_cost = service.cost
    if current_balance < service_cost:
        return failure_response("User doesn't have enough quotas in their balance")
    user.quotas_left = current_balance - service_cost
    service.users.append(user)
    db.session.commit()
    return success_response(user.serialize())


if __name__ == "__main__":
    app.run(host="0.0.0.0", port=8000, debug=True)
