json.array!(@profiles) do |profile|
  json.extract! profile, :id, :summary, :work_as, :work_in, :experiences, :interests, :skills, :languages, :organizations, :user_id
  json.url profile_url(profile, format: :json)
end
