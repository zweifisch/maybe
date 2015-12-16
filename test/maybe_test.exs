defmodule MaybeTest do
  use ExUnit.Case
  doctest Maybe

  import Maybe

  def incr(num) do
    num + 1
  end

  test "ok" do
    assert ({:ok, 1} |> ok &incr/1) == {:ok, 2}
    assert ({:error, 1} |> ok &incr/1) == {:error, 1}
    assert (:error |> ok &incr/1) == :error
    assert (:ok |> ok &(incr/1)) == :ok
    assert ({:ok, 1} |> ok &({:error, &1 + 1})) == {:error, 2}
    assert ({:ok, 1} |> ok &({:ok , &1 + 1})) == {:ok, 2}
  end

  test "error" do
    assert ({:ok, 1} |> error &incr/1) == {:ok, 1}
    assert ({:error, 1} |> error &incr/1) == {:error, 2}
    assert (:error |> error &incr/1) == :error
    assert (:ok |> error &incr/1) == :ok
    assert ({:error, 1} |> error &({:ok, &1 + 1})) == {:ok, 2}
    assert ({:error, 1} |> error &({:error, &1 + 1})) == {:error, 2}
  end

  test "chained" do
    assert ({:ok, 1} |> ok(&incr/1) |> ok(&incr/1)) == {:ok, 3}
  end
end
