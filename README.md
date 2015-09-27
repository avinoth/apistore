# apistore

apistore is a self hosted rails app to store and retrieve JSON data.

Probably usecases,
* JSON data basckup.
* For data for which DB is overkill and can't store it in a filesystem.

Endpoints are,

```
endpoints": {

    "create": "POST /stores",
    "read": "GET /stores/:id?token=:access_token",
    "update": "POST /stores/:id?token=:access_token",
    "delete": "DELETE /stores/:id?token=:access_token"

}
```

[SAMPLE APP](http://apistoredemo.herokuapp.com/)
