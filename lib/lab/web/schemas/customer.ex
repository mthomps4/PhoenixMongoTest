defmodule Customer do
  use Ecto.Schema
  import Ecto.Changeset
  import Ecto.Query
  alias Lab.Repo

  @primary_key {:_id, :binary_id, autogenerate: true}
  schema "customers" do
    field :name, :string
    field :age, :integer, default: 0
  end

  def changeset(customers, params \\ %{}) do
    customers
    |> cast(params, [:name, :age])
    |> validate_required([:name, :age])
  end

  def all do
    Repo.all(Customer)
  end

  def create_customer(attrs \\ %{}) do
    chset = Customer.changeset(%Customer{}, attrs)
    case Repo.insert(chset) do
        {:ok, post} -> IO.inspect(post)
        {:error, chset} -> IO.inspect(chset)
    end
  end

end
