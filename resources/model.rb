actions :create, :delete

attribute :name, :kind_of => String, :name_attribute => true, :required => true
attribute :description, :kind_of => String
attribute :definition, :kind_of => String, :required => true
attribute :cron_options, :kind_of => Hash
attribute :schedule, :kind_of => Hash

# Set default
def initialize(*args)
  super
  @action = :create
end
