$ErrorActionPreference = "Stop"
$command = if ($args.Count -gt 0) { $args[0] } else { "all" }
python reproduce.py $command
