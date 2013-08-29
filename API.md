## Start new pomodoro

`POST /pomodoro`

* owner
* repo
* issue_id
* started_at

response:

{
  pomodoro: {
    id: "1",
  }
}

## Complete a pomodoro

`PATCH /pomodoro`

* id
* completed_at

## Cancel a pomodoro

`PATCH /pomodoro`

* id
* cancelled_at
