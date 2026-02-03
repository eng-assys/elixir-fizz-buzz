defmodule FizzBuzzTest do
  use ExUnit.Case

  describe "build/1" do
    test "returns FizzBuzz results for numbers in the file" do
      {:ok, result} = FizzBuzz.build("numbers.txt")
      assert result == [1, 2, "Fizz", 4, "Buzz", "Buzz", "FizzBuzz", "Buzz"]
    end

    test "returns an error tuple when the file does not exist" do
      {:error, reason} = FizzBuzz.build("non_existent_file.txt")
      assert reason =~ "Error reading file"
    end
  end
end
