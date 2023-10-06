# Define the username for which you want to find the tasks
$userName = "UserName"

# Fetch all scheduled tasks
$scheduledTasks = Get-ScheduledTask | ForEach-Object {
    $taskInfo = $_ | Get-ScheduledTaskInfo
    $actions = $_.Actions
    $actionPath = "N/A"
    foreach ($action in $actions) {
        if ($action.Execute) {
            $actionPath = $action.Execute
        }
    }
    [PSCustomObject]@{
        TaskName    = $_.TaskName
        TaskPath    = $_.TaskPath
        ExecutePath = $actionPath
        Author      = $_.Author
        State       = $taskInfo.State
        LastRunTime = $taskInfo.LastRunTime
        UserId      = $_.Principal.UserId
    }
}

# Filter tasks based on the username and display them
$filteredTasks = $scheduledTasks | Where-Object { $_.UserId -eq $userName }

$filteredTasks | Format-Table -AutoSize
