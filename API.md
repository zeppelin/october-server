## Start new pomodoro

`POST /pomodoro`

* owner
* repo
* issue_id
* started_at

## Complete a pomodoro

`PATCH /pomodoro`

* id
* completed_at

## Cancel a pomodoro

`PATCH /pomodoro`

* id
* cancelled_at
