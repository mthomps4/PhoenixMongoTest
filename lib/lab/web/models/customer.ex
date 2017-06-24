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
    `create_customer` take s a name :string, and age :integer to create a new `%Customer`

    ## Examples
        iex> Customer.create_customer("Joe")
        %Customer{__meta__: #Ecto.Schema.Metadata<:loaded, "customers">, _id: "594e926fe689261fbb102443", age: 32, name: "Joe"}

    """
  def create_customer(name, age) do
    case Repo.insert(%Customer{name: name, age: age}) do
      {:ok, post} -> IO.inspect(post)
      {:error, struct} -> IO.inspect(struct)
    end
  end

end
