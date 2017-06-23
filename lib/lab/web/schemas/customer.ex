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

  def create_customer(name, age) do
    # chset = Customer.changeset(%Customer{}, attributes)
    # struct = %Customer{name: name, age: age}
    IO.puts("******")
    IO.inspect name
    IO.inspect age
    IO.puts("******")
    Repo.insert(%Customer{name: name, age: age})
    # case Repo.insert(%Customer{name: name, age: age}) do
    #   {:ok, post} -> IO.puts(post)
    #   {:error, chset} -> IO.puts(chset)
    # end
  end

end
