defmodule FizzBuzz do
  def build(file_name) do
    file_name
    |> File.read()
    |> handle_file_read()
  end

  defp handle_file_read({:ok, result}) do
    response =
      String.split(result, ",")
      |> Enum.map(&convert_and_evaluate_numbers/1)

    {:ok, response}
  end

  defp handle_file_read({:error, reason}), do: {:error, "Error reading file: #{reason}"}

  defp convert_and_evaluate_numbers(number) do
    String.to_integer(number)
    |> evaluate_number()
  end

  # Pattern Matching is sequential, so the order of the function clauses matters
  defp evaluate_number(number)
       when rem(number, 3) == 0 and rem(number, 5) == 0, do: "FizzBuzz"

  defp evaluate_number(number)
       when rem(number, 3) == 0, do: "Fizz"

  defp evaluate_number(number)
       when rem(number, 5) == 0, do: "Buzz"

  defp evaluate_number(number), do: number
end
