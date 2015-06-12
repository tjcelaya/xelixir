
project_root = File.cwd!
active_problems = "config.json" |> File.read! |> Poison.decode! |> Dict.get "problems"

Enum.each active_problems, fn dir ->
    File.cd! dir
    "*test.ex*" |> Path.wildcard |> List.first |> Code.load_file
    File.cd! project_root
end

ExUnit.start()