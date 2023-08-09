require 'microsoft_kiota_abstractions'
require_relative '../microsoft_graph'
require_relative '../models/o_data_errors_o_data_error'
require_relative '../models/user'
require_relative '../models/user_collection_response'
require_relative './count/count_request_builder'
require_relative './delta/delta_request_builder'
require_relative './get_available_extension_properties/get_available_extension_properties_request_builder'
require_relative './get_by_ids/get_by_ids_request_builder'
require_relative './item/user_item_request_builder'
require_relative './users'
require_relative './validate_properties/validate_properties_request_builder'

module MicrosoftGraph
    module Users
        ## 
        # Provides operations to manage the collection of user entities.
        class UsersRequestBuilder < MicrosoftKiotaAbstractions::BaseRequestBuilder
            
            ## 
            # Provides operations to count the resources in the collection.
            def count()
                return MicrosoftGraph::Users::Count::CountRequestBuilder.new(@path_parameters, @request_adapter)
            end
            ## 
            # Provides operations to call the delta method.
            def delta()
                return MicrosoftGraph::Users::Delta::DeltaRequestBuilder.new(@path_parameters, @request_adapter)
            end
            ## 
            # Provides operations to call the getAvailableExtensionProperties method.
            def get_available_extension_properties()
                return MicrosoftGraph::Users::GetAvailableExtensionProperties::GetAvailableExtensionPropertiesRequestBuilder.new(@path_parameters, @request_adapter)
            end
            ## 
            # Provides operations to call the getByIds method.
            def get_by_ids()
                return MicrosoftGraph::Users::GetByIds::GetByIdsRequestBuilder.new(@path_parameters, @request_adapter)
            end
            ## 
            # Provides operations to call the validateProperties method.
            def validate_properties()
                return MicrosoftGraph::Users::ValidateProperties::ValidatePropertiesRequestBuilder.new(@path_parameters, @request_adapter)
            end
            ## 
            ## Provides operations to manage the collection of user entities.
            ## @param user_id The unique identifier of user
            ## @return a user_item_request_builder
            ## 
            def by_user_id(user_id)
                raise StandardError, 'user_id cannot be null' if user_id.nil?
                url_tpl_params = @path_parameters.clone
                url_tpl_params["user%2Did"] = user_id
                return MicrosoftGraph::Users::Item::UserItemRequestBuilder.new(url_tpl_params, @request_adapter)
            end
            ## 
            ## Instantiates a new UsersRequestBuilder and sets the default values.
            ## @param path_parameters Path parameters for the request
            ## @param request_adapter The request adapter to use to execute the requests.
            ## @return a void
            ## 
            def initialize(path_parameters, request_adapter)
                super(path_parameters, request_adapter, "{+baseurl}/users{?%24top,%24search,%24filter,%24count,%24orderby,%24select,%24expand}")
            end
            ## 
            ## Retrieve a list of user objects.
            ## @param request_configuration Configuration for the request such as headers, query parameters, and middleware options.
            ## @return a Fiber of user_collection_response
            ## 
            def get(request_configuration=nil)
                request_info = self.to_get_request_information(
                    request_configuration
                )
                error_mapping = Hash.new
                error_mapping["4XX"] = lambda {|pn| MicrosoftGraph::Models::ODataErrorsODataError.create_from_discriminator_value(pn) }
                error_mapping["5XX"] = lambda {|pn| MicrosoftGraph::Models::ODataErrorsODataError.create_from_discriminator_value(pn) }
                return @request_adapter.send_async(request_info, lambda {|pn| MicrosoftGraph::Models::UserCollectionResponse.create_from_discriminator_value(pn) }, error_mapping)
            end
            ## 
            ## Create a new user.The request body contains the user to create. At a minimum, you must specify the required properties for the user. You can optionally specify any other writable properties.
            ## @param body The request body
            ## @param request_configuration Configuration for the request such as headers, query parameters, and middleware options.
            ## @return a Fiber of user
            ## 
            def post(body, request_configuration=nil)
                raise StandardError, 'body cannot be null' if body.nil?
                request_info = self.to_post_request_information(
                    body, request_configuration
                )
                error_mapping = Hash.new
                error_mapping["4XX"] = lambda {|pn| MicrosoftGraph::Models::ODataErrorsODataError.create_from_discriminator_value(pn) }
                error_mapping["5XX"] = lambda {|pn| MicrosoftGraph::Models::ODataErrorsODataError.create_from_discriminator_value(pn) }
                return @request_adapter.send_async(request_info, lambda {|pn| MicrosoftGraph::Models::User.create_from_discriminator_value(pn) }, error_mapping)
            end
            ## 
            ## Retrieve a list of user objects.
            ## @param request_configuration Configuration for the request such as headers, query parameters, and middleware options.
            ## @return a request_information
            ## 
            def to_get_request_information(request_configuration=nil)
                request_info = MicrosoftKiotaAbstractions::RequestInformation.new()
                request_info.url_template = @url_template
                request_info.path_parameters = @path_parameters
                request_info.http_method = :GET
                request_info.headers.add('Accept', 'application/json')
                unless request_configuration.nil?
                    request_info.add_headers_from_raw_object(request_configuration.headers)
                    request_info.set_query_string_parameters_from_raw_object(request_configuration.query_parameters)
                    request_info.add_request_options(request_configuration.options)
                end
                return request_info
            end
            ## 
            ## Create a new user.The request body contains the user to create. At a minimum, you must specify the required properties for the user. You can optionally specify any other writable properties.
            ## @param body The request body
            ## @param request_configuration Configuration for the request such as headers, query parameters, and middleware options.
            ## @return a request_information
            ## 
            def to_post_request_information(body, request_configuration=nil)
                raise StandardError, 'body cannot be null' if body.nil?
                request_info = MicrosoftKiotaAbstractions::RequestInformation.new()
                request_info.url_template = @url_template
                request_info.path_parameters = @path_parameters
                request_info.http_method = :POST
                request_info.headers.add('Accept', 'application/json')
                unless request_configuration.nil?
                    request_info.add_headers_from_raw_object(request_configuration.headers)
                    request_info.add_request_options(request_configuration.options)
                end
                request_info.set_content_from_parsable(@request_adapter, "application/json", body)
                return request_info
            end

            ## 
            # Retrieve a list of user objects.
            class UsersRequestBuilderGetQueryParameters
                
                ## 
                # Include count of items
                attr_accessor :count
                ## 
                # Expand related entities
                attr_accessor :expand
                ## 
                # Filter items by property values
                attr_accessor :filter
                ## 
                # Order items by property values
                attr_accessor :orderby
                ## 
                # Search items by search phrases
                attr_accessor :search
                ## 
                # Select properties to be returned
                attr_accessor :select
                ## 
                # Show only the first n items
                attr_accessor :top
                ## 
                ## Maps the query parameters names to their encoded names for the URI template parsing.
                ## @param original_name The original query parameter name in the class.
                ## @return a string
                ## 
                def get_query_parameter(original_name)
                    raise StandardError, 'original_name cannot be null' if original_name.nil?
                    case original_name
                        when "count"
                            return "%24count"
                        when "expand"
                            return "%24expand"
                        when "filter"
                            return "%24filter"
                        when "orderby"
                            return "%24orderby"
                        when "search"
                            return "%24search"
                        when "select"
                            return "%24select"
                        when "top"
                            return "%24top"
                        else
                            return original_name
                    end
                end
            end
        end
    end
end
