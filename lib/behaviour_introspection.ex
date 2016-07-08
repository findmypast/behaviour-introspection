defmodule BehaviourIntrospection do
  import DefMemo

  defmemo available_modules_with_behaviour(behaviour) do
    # Ensure the current projects code path is loaded
    Mix.Task.run("loadpaths", [])

    # Fetch all .beam files
    Path.wildcard(Path.join([Mix.Project.build_path, "**/ebin/**/*.beam"]))
    # Parse the BEAM for behaviour implementations
    |> Stream.map(fn path ->
      {:ok, {mod, chunks}} = :beam_lib.chunks('#{path}', [:attributes])
      {mod, get_in(chunks, [:attributes, :behaviour])}
    end)
      # Filter out behaviours we don't care about and duplicates
    |> Stream.filter(fn {_mod, all_behaviours} -> is_list(all_behaviours) && behaviour in all_behaviours end)
    |> Enum.uniq
    |> Enum.map(fn {module, _} -> module end)
  end

end
