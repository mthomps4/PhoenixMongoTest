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

  def changeset(customer, params \\ %{}) do
    customer
    |> cast(params, [:name, :age])
    |> validate_required([:name, :age])
  end


  def all do
    Repo.all(Customer)
  end

  @doc """
  `by_name` takes a name and returns all customers with `name`

    ## Examples
      iex> Customer.by_name("Joe")
      [%{"age" => 32, "name" => "Joe"}]

  """
  def by_name(name) do
    query = from u in "customers",
          where: u.name == ^name,
          select: u
    Repo.all(query)
  end

  @doc """
    `create_customer` take s a name :string, and age :integer to create a new `%Customer`

    ## Examples
        Customer.create_customer("Bill", 32)
        %Customer{__meta__: #Ecto.Schema.Metadata<:loaded, "customers">, _id: "594eac40e689264fa67f9d31", age: 32, name: "Bill"}

    """
  def create_customer(name, age) do
    case Repo.insert(%Customer{name: name, age: age}) do
      {:ok, post} -> IO.inspect(post)
      {:error, struct} -> IO.inspect(struct)
    end
  end

  @doc """
    `update_by_id` update customer information by _id.

    ## Examples
      Customer.update_by_id("594e907ce689261a7af36d32", %{name: "Timmy"})

    """
  def update_by_id(id, params \\ %{}) do
    customer = Repo.get!(Customer, id)
    customerChangeSet = Customer.changeset(customer, params)
    case Repo.update!(customerChangeSet) do
      {:ok, ok} -> IO.inspect(ok)
      # {:error, err} -> IO.puts(err)
      error -> error
    end

  end



end
