## Start new pomodoro

`POST /pomodoro`

```json
{
  "pomodoro": {
    "started_at":"2013-08-19T14:29Z",
    "issue": {
      "owner": "ember.js",
      "repo": "emberjs",
      "github_issue_id": 1
    }
  }
}
```

Response:

```json
{
    "pomodoro": {
        "id": 3,
        "started_at": "2013-08-19T14:29:00.000Z",
        "completed_at": null,
        "cancelled_at": null,
        "issue_id": 1,
        "created_at": "2013-08-29T12:45:39.830Z",
        "updated_at": "2013-08-29T12:45:39.830Z"
    }
}
```
## Complete a pomodoro

`PATCH /pomodoro/3`

```json
{
  "pomodoro": {
    "completed_at":"2013-08-19T14:29Z"
  }
}
```

Response:

```json
{
    "pomodoro": {
        "id": 3,
        "started_at": "2013-08-19T14:29:00.000Z",
        "completed_at": "2013-08-19T14:29:00.000Z",
        "cancelled_at": null,
        "issue_id": 1,
        "created_at": "2013-08-29T12:45:39.830Z",
        "updated_at": "2013-08-29T12:46:11.812Z"
    }
}
```

## Cancel a pomodoro

`PATCH /pomodoro/4`

```json
{
  "pomodoro": {
    "cancelled_at":"2013-08-19T14:29Z"
  }
}
```

Response:

```json
{
    "pomodoro": {
        "id": 5,
        "started_at": "2013-08-19T14:29:00.000Z",
        "completed_at": null,
        "cancelled_at": "2013-08-19T14:29:00.000Z",
        "issue_id": 1,
        "created_at": "2013-08-29T12:47:19.836Z",
        "updated_at": "2013-08-29T12:48:20.610Z"
    }
}
```

## List Issues

GET /issues/?owner=emberjs&repo=ember.js

Response:

```
{
    "issues": [
        {
            "id": 4,
            "title": null,
            "pomodoro_count": 2
        },
        {
            "id": 5,
            "title": null,
            "pomodoro_count": 2
        },
        {
            "id": 6,
            "title": null,
            "pomodoro_count": 1
        }
    ]
}
```
