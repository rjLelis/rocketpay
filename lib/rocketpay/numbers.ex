defmodule Rocketpay.Numbers do
  def sum_from_file(filename) do
    "#{filename}.csv"
    |> File.read
    |> handle_file
  end

  defp handle_file({:ok, content}) do
    result = content
      |> String.trim
      |> String.split(",")
      |> Stream.map(fn number -> String.to_integer number end)
      |> Enum.sum
    {:ok, %{result: result}}
  end

  defp handle_file({:error, _reason}), do: {:error, %{message: "Invalid file!"}}
end
