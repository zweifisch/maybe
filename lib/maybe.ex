defmodule Maybe do

  def ok(result, f) do
    case result do
      {:ok, value} ->
        case f.(value) do
          {:ok, val} -> {:ok, val}
          {:error, val} -> {:error, val}
          val -> {:ok, val}
        end
      _ -> result
    end
  end

  def error(result) do
    {:ok, value} -> result
    _ ->
      case f.(value) do
        {:ok, val} -> {:ok, val}
        {:error, val} -> {:error, val}
        val -> {:error, val}
      end
  end

end
