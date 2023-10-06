# Define the usernames for which you want to find the tasks
$userNames = @("UserName-000", "UserName-001", "UserName-002")

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

# Filter tasks based on the usernames and display them
$filteredTasks = $scheduledTasks | Where-Object { $userNames -contains $_.UserId }

# Write to a file
$filteredTasks | Format-Table -AutoSize | Out-File -FilePath "C:\Temp\FilteredTasks.txt"
