AppSchema = GraphQL::Schema.define do
  mutation(Types::MutationType)
  query(Types::QueryType)
end

Schema = GraphQL::Schema.define do
  query QueryType
end