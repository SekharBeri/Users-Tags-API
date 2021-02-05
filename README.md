# README

DATABASE SETUP
-----------------------------------------------

To import intial test data run

rails db:seed

===============================================


API service routes
-----------------------------------------------
For Authentication
------------------------------------------------

POST /api/v1/login

POST /api/v1/logout

For Users
------------------------------------------------

GET    /api/v1/users

query parameters for sorting { sort_by: [column_name]}

POST   /api/v1/users

GET    /api/v1/users/:id

PATCH  /api/v1/users/:id

PUT    /api/v1/users/:id

DELETE /api/v1/users/:id

POST   /api/v1/users/:user_id/add_tags

params: { tags: ["Tag 1", "Tag 2"] }

DELETE /api/v1/users/:user_id/remove_tags

{ tags: ["Tag 1", "Tag 2"] }


For Tags
----------------------------------------------------

GET    /api/v1/tags

query parameters for sorting { sort_by: [column_name]}

POST   /api/v1/tags

GET    /api/v1/tags/:id

PATCH  /api/v1/tags/:id

PUT    /api/v1/tags/:id

DELETE /api/v1/tags/:id



