require 'microsoft_kiota_abstractions'
require_relative '../../../../../microsoft_graph'
require_relative '../../../../../models/offer_shift_request'
require_relative '../../../../../models/offer_shift_request_collection_response'
require_relative '../../../../../models/o_data_errors_o_data_error'
require_relative '../../../../me'
require_relative '../../../joined_teams'
require_relative '../../item'
require_relative '../schedule'
require_relative './count/count_request_builder'
require_relative './item/offer_shift_request_item_request_builder'
require_relative './offer_shift_requests'

module MicrosoftGraph
    module Me
        module JoinedTeams
            module Item
                module Schedule
                    module OfferShiftRequests
                        ## 
                        # Provides operations to manage the offerShiftRequests property of the microsoft.graph.schedule entity.
                        class OfferShiftRequestsRequestBuilder < MicrosoftKiotaAbstractions::BaseRequestBuilder
                            
                            ## 
                            # Provides operations to count the resources in the collection.
                            def count()
                                return MicrosoftGraph::Me::JoinedTeams::Item::Schedule::OfferShiftRequests::Count::CountRequestBuilder.new(@path_parameters, @request_adapter)
                            end
                            ## 
                            ## Provides operations to manage the offerShiftRequests property of the microsoft.graph.schedule entity.
                            ## @param offer_shift_request_id The unique identifier of offerShiftRequest
                            ## @return a offer_shift_request_item_request_builder
                            ## 
                            def by_offer_shift_request_id(offer_shift_request_id)
                                raise StandardError, 'offer_shift_request_id cannot be null' if offer_shift_request_id.nil?
                                url_tpl_params = @path_parameters.clone
                                url_tpl_params["offerShiftRequest%2Did"] = offer_shift_request_id
                                return MicrosoftGraph::Me::JoinedTeams::Item::Schedule::OfferShiftRequests::Item::OfferShiftRequestItemRequestBuilder.new(url_tpl_params, @request_adapter)
                            end
                            ## 
                            ## Instantiates a new OfferShiftRequestsRequestBuilder and sets the default values.
                            ## @param path_parameters Path parameters for the request
                            ## @param request_adapter The request adapter to use to execute the requests.
                            ## @return a void
                            ## 
                            def initialize(path_parameters, request_adapter)
                                super(path_parameters, request_adapter, "{+baseurl}/me/joinedTeams/{team%2Did}/schedule/offerShiftRequests{?%24top,%24skip,%24search,%24filter,%24count,%24orderby,%24select,%24expand}")
                            end
                            ## 
                            ## Retrieve the properties and relationships of all offerShiftRequest objects in a team.
                            ## @param request_configuration Configuration for the request such as headers, query parameters, and middleware options.
                            ## @return a Fiber of offer_shift_request_collection_response
                            ## 
                            def get(request_configuration=nil)
                                request_info = self.to_get_request_information(
                                    request_configuration
                                )
                                error_mapping = Hash.new
                                error_mapping["4XX"] = lambda {|pn| MicrosoftGraph::Models::ODataErrorsODataError.create_from_discriminator_value(pn) }
                                error_mapping["5XX"] = lambda {|pn| MicrosoftGraph::Models::ODataErrorsODataError.create_from_discriminator_value(pn) }
                                return @request_adapter.send_async(request_info, lambda {|pn| MicrosoftGraph::Models::OfferShiftRequestCollectionResponse.create_from_discriminator_value(pn) }, error_mapping)
                            end
                            ## 
                            ## Create an instance of an offerShiftRequest.
                            ## @param body The request body
                            ## @param request_configuration Configuration for the request such as headers, query parameters, and middleware options.
                            ## @return a Fiber of offer_shift_request
                            ## 
                            def post(body, request_configuration=nil)
                                raise StandardError, 'body cannot be null' if body.nil?
                                request_info = self.to_post_request_information(
                                    body, request_configuration
                                )
                                error_mapping = Hash.new
                                error_mapping["4XX"] = lambda {|pn| MicrosoftGraph::Models::ODataErrorsODataError.create_from_discriminator_value(pn) }
                                error_mapping["5XX"] = lambda {|pn| MicrosoftGraph::Models::ODataErrorsODataError.create_from_discriminator_value(pn) }
                                return @request_adapter.send_async(request_info, lambda {|pn| MicrosoftGraph::Models::OfferShiftRequest.create_from_discriminator_value(pn) }, error_mapping)
                            end
                            ## 
                            ## Retrieve the properties and relationships of all offerShiftRequest objects in a team.
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
                            ## Create an instance of an offerShiftRequest.
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
                            # Retrieve the properties and relationships of all offerShiftRequest objects in a team.
                            class OfferShiftRequestsRequestBuilderGetQueryParameters
                                
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
                                # Skip the first n items
                                attr_accessor :skip
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
                                        when "skip"
                                            return "%24skip"
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
            end
        end
    end
end
