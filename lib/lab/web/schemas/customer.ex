defmodule Customer do
  use Ecto.Schema
  import Ecto.Changeset
  import Ecto.Query
  alias Lab.Repo

  @primary_key {:_id, :string, autogenerate: false}
  schema "customers" do
    field :name, :string
    field :age, :integer, default: 0
  end

  def changeset(customers, params \\ %{}) do
    customers
    |> cast(params, [:_id, :name, :age])
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

  def create_customer(attributes \\ %{}) do
    chset = Customer.changeset(%Customer{}, attributes)
    case Repo.insert(chset) do
      {:ok, post} -> IO.inspect(post)
      {:error, chset} -> IO.inspect(chset)
    end
  end

end
