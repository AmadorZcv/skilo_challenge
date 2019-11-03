defimpl Jason.Encoder, for: Money do
  def encode(struct, _opts) do
    amount =
      Money.to_string(struct, symbol: false, separator: "", delimiter: ".")
      |> String.to_float()

    Jason.Encode.float(amount)
  end
end
