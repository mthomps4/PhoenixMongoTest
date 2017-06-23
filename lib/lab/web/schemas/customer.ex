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

  def by_name(name) do
    query = from u in "customers",
          where: u.name == ^name,
          select: u
    Repo.all(query)
  end

    @doc """
    Create customer with name and age params
    Reminder protocol String.Chars not implemented -- Use IO.inspect

    Example

    iex> Customer.create_customer("James", 23)
    %Customer{__meta__: #Ecto.Schema.Metadata<:loaded, "customers">, _id: "594d7ba8de395d127a2ae531", age: 23, name: "James"}

    """
  def create_customer(name, age) do
    case Repo.insert(%Customer{name: name, age: age}) do
      {:ok, post} -> IO.inspect(post)
      {:error, struct} -> IO.inspect(struct)
    end
  end

end
