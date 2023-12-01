from flask_sqlalchemy import SQLAlchemy

db = SQLAlchemy()

user_service_assoc_table = db.Table(
    "user_service_assoc_table",
    db.Column("user_id", db.Integer, db.ForeignKey("user.id")),
    db.Column("service_id", db.Integer, db.ForeignKey("service.id")),
)


class User(db.Model):
    """
    Users model
    """

    __tablename__ = "user"
    id = db.Column(db.Integer, primary_key=True, autoincrement=True)
    username = db.Column(db.String, nullable=False)
    quotas_left = db.Column(db.Integer, nullable=False)
    profile_picture = db.Column(db.String, nullable=False)
    services = db.relationship(
        "Service",
        secondary=user_service_assoc_table,
        back_populates="users",
    )

    def __init__(self, **kwargs):
        """
        Initialize a user object
        """
        self.username = kwargs.get("username")
        self.quotas_left = kwargs.get("quotas_left")
        self.profile_picture = kwargs.get("profile_picture")

    def serialize(self):
        """
        Serializes a user object
        """
        return {
            "id": self.id,
            "username": self.username,
            "quotas_left": self.quotas_left,
            "profile_picture": self.profile_picture,
            "services": [s.serialize_basic_info() for s in self.services],
        }

    def serialize_basic_info(self):
        """
        Serializes a user object without information about services
        """
        return {
            "id": self.id,
            "username": self.username,
            "quotas_left": self.quotas_left,
            "profile_picture": self.profile_picture,
        }


class Service(db.Model):
    """
    Service model
    """

    __tablename__ = "service"
    id = db.Column(db.Integer, primary_key=True, autoincrement=True)
    image_url = db.Column(db.String, nullable=False)
    name = db.Column(db.String, nullable=False)
    description = db.Column(db.String, nullable=False)
    popularity = db.Column(db.Float, nullable=False)
    cost = db.Column(db.Integer, nullable=False)
    users = db.relationship(
        "User",
        secondary=user_service_assoc_table,
        back_populates="services",
    )

    def __init__(self, **kwargs):
        """
        Initialize a service object
        """
        self.name = kwargs.get("name")
        self.description = kwargs.get("description")
        self.popularity = kwargs.get("popularity")
        self.cost = kwargs.get("cost")
        self.image_url = kwargs.get("image_url")

    def serialize(self):
        """
        Serializes a service object
        """
        return {
            "id": self.id,
            "image_url": self.image_url,
            "name": self.name,
            "description": self.description,
            "popularity": self.popularity,
            "cost": self.cost,
            "users": [u.serialize_basic_info() for u in self.users],
        }

    def serialize_basic_info(self):
        """
        Serializes a service object without information about users
        """
        return {
            "id": self.id,
            "image_url": self.image_url,
            "name": self.name,
            "description": self.description,
            "popularity": self.popularity,
            "cost": self.cost,
        }
