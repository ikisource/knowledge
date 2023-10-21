# REST architecture

REST (Representational state transfer) is a software architectural style that was created to guide the design and development of the architecture for the World Wide Web.

introduced and defined in 2000 by computer scientist Roy Fielding

## Guiding constraints
- Client–server architecture  
The client-server design pattern enforces the principle of separation of concerns: separating the user interface concerns from the data storage concerns
- Statelessness  
no session information is retained by the receiver, usually a server.
Relevant session data is sent to the receiver by the client in such a way that every packet of information transferred can be understood in isolation, without context information from previous packets in the session.
- Cacheability  
  As on the World Wide Web, clients and intermediaries can cache responses
- Uniform interface  
  - Identification : resources should be identified using consistent and standardized URIs that allow to locate and interact with resources on the web.
  - Representation : the state of the resource, at any particular time (ex JSON fields)
  - Self-descriptive messages : each resource representation should carry enough information to describe how to process the message (media type, links to related resources, and any relevant headers)
  - HATEOAS (Hypermedia as the engine of application state) : the client should have only the initial URI of the application. The client application should dynamically drive all other resources and interactions with the use of hyperlinks.

## Resource
The key abstraction of information in REST is a resource.
Any information that we can name can be a resource (ex: Customer, Order)  
A REST API consists of an assembly of interlinked resources.
This set of resources is known as the REST API’s resource model 
![](/home/olivier/dev/knowledge/architecture/REST/REST model.svg)

## URI
scheme://host:port/path?queryString#fragment
http://society.com:8080/customers?page=5&pageSize=20
http://society.com:8080/customers/123

## Path
No verbs but nouns : The action is held by the HTTP verb (GET, POST, PUT, DELETE, PATCH, OPTIONS, HEAD)

get the list of customers : GET /customer/list ❌ GET /customers ✅  
create a customer : POST /customer/create❌ POST /customers ✅  
delete a customer : POST /customer/1/delete ❌ DELETE /customers/1 ✅  

## Method
Idempotent : idempotent methods can modify data at the first call. The next calls will have no effects on data and response remains the same.  
Sure : methods don't modify data on the server

## Create a resource
Idempotent ❌, Sure ❌  
POST /customers
BODY: {"name"="customer1"}

Response  
Code: 201 Created
Header Location: /customers/123

## Get a resource
Idempotent ✅, Sure ✅  
GET /customers/123  

Response  
BODY: {"id"="123", name"="customer1"}  
Code: 200 OK

## Update a resource
Idempotent ✅, Sure ❌  
PUT /customers/123  
BODY: {name"="customer1-updated"}

Response  
Code: 204 No Content

## Delete a resource
Idempotent ✅, Sure ❌  
delete /customers/123  

Response  
Code: 204 No Content

## Patch a resource
Idempotent ✅, Sure ❌  
PATCH /customers/123  
BODY: {"name"="customer1-updated"}

Response  
Code: 204 No Content

## HATEOAS

```
{
  "customers": [
    {
      "customerId": 1,
      "name": "Alice",
      "links": [
        {
          "rel": "self",
          "href": "/customers/1"
        },
        {
          "rel": "orders",
          "href": "/customers/1/orders"
        }
      ]
    },
    {
      "customerId": 2,
      "name": "Bob",
      "links": [
        {
          "rel": "self",
          "href": "/customers/2"
        },
        {
          "rel": "orders",
          "href": "/customers/2/orders"
        }
      ]
    }
  ],
  "links": [
    {
      "rel": "self",
      "href": "/customers"
    }
  ]
}
```





