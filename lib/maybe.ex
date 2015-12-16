defmodule Maybe do

  def ok(result, f) do
    case result do
      {:ok, value} ->
        case ret = f.(value) do
          {:ok, _} -> ret
          {:error, _} -> ret
          _ -> {:ok, ret}
        end
      _ -> result
    end
  end

  def error(result, f) do
    case result do
      {:error, value} ->
        case ret = f.(value) do
          {:ok, _} -> ret
          {:error, _} -> ret
          _ -> {:error, ret}
        end
      _ -> result
    end
  end

end
