Types::PostType = GraphQL::ObjectType.define do
  name "Post"
  field :title, types.String
  field :rating, types.Int
  field :comments, types[Types::CommentType]
end
