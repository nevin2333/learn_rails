UserType = GraphQL::ObjectType.define do
  name "User"
  field :id, !types.ID
  field :username, !types.String
  field :real_name, !types.String
end

UserQuery = GraphQL::ObjectType.define do
  name "UserQuery"
  field :user_action do # 这个filed 解释作action更合理。
    type UserType
    argument :id, !types.ID # 接收参数
    resolve -> (obj, args, ctx) { User.find(args["id"]) }
  end
end

# query_string = "{user_action(id: 1){id username real_name}}"

UserSchema = GraphQL::Schema.define do
  query UserQuery
end

# ================================
# 带参数的调用方法
query_string = "
  query getPost($userId: ID!) {
    user(id: $userId) {
      id username real_name
    }
  }"

variables = { "userId" => "1" }

UserSchema.execute(query_string, variables: variables)
# ================================