defmodule Customer do
  use Ecto.Schema
  import Ecto.Changeset

  # @primary_key {:_id, :binary_id, autogenerate: true}
  schema "customer" do
    field :name, :string
    field :age, :integer, default: 0
  end

  def changeset(customer, params \\ %{}) do
    customer
    |> cast(params, [:name, :age])
    |> validate_required([:name, :age])
    # |> validate_inclusion(:age, 18..100)
  end

end
