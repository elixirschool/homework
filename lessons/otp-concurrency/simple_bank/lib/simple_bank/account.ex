defmodule SimpleBank.Account do
  @type t :: %__MODULE__{balance: integer(), id: String.t(), name: String.t()}

  defstruct [:balance, :id, :name]
end
