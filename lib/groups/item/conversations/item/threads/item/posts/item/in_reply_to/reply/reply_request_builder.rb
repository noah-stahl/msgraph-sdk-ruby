require 'microsoft_kiota_abstractions'
require_relative '../../../../../../../../../../microsoft_graph'
require_relative '../../../../../../../../../../models/o_data_errors_o_data_error'
require_relative '../../../../../../../../../groups'
require_relative '../../../../../../../../item'
require_relative '../../../../../../../conversations'
require_relative '../../../../../../item'
require_relative '../../../../../threads'
require_relative '../../../../item'
require_relative '../../../posts'
require_relative '../../item'
require_relative '../in_reply_to'
require_relative './reply'

module MicrosoftGraph
    module Groups
        module Item
            module Conversations
                module Item
                    module Threads
                        module Item
                            module Posts
                                module Item
                                    module InReplyTo
                                        module Reply
                                            ## 
                                            # Provides operations to call the reply method.
                                            class ReplyRequestBuilder < MicrosoftKiotaAbstractions::BaseRequestBuilder
                                                
                                                ## 
                                                ## Instantiates a new ReplyRequestBuilder and sets the default values.
                                                ## @param path_parameters Path parameters for the request
                                                ## @param request_adapter The request adapter to use to execute the requests.
                                                ## @return a void
                                                ## 
                                                def initialize(path_parameters, request_adapter)
                                                    super(path_parameters, request_adapter, "{+baseurl}/groups/{group%2Did}/conversations/{conversation%2Did}/threads/{conversationThread%2Did}/posts/{post%2Did}/inReplyTo/reply")
                                                end
                                                ## 
                                                ## Create an open extension (openTypeExtension object) and add custom properties in a new or existing instance of a resource. You can create an open extension in a resource instance and store custom data to it all in the same operation, except for specific resources. The table in the Permissions section lists the resources that support open extensions.
                                                ## @param body The request body
                                                ## @param request_configuration Configuration for the request such as headers, query parameters, and middleware options.
                                                ## @return a Fiber of void
                                                ## 
                                                def post(body, request_configuration=nil)
                                                    raise StandardError, 'body cannot be null' if body.nil?
                                                    request_info = self.to_post_request_information(
                                                        body, request_configuration
                                                    )
                                                    error_mapping = Hash.new
                                                    error_mapping["4XX"] = lambda {|pn| MicrosoftGraph::Models::ODataErrorsODataError.create_from_discriminator_value(pn) }
                                                    error_mapping["5XX"] = lambda {|pn| MicrosoftGraph::Models::ODataErrorsODataError.create_from_discriminator_value(pn) }
                                                    return @request_adapter.send_async(request_info, nil, error_mapping)
                                                end
                                                ## 
                                                ## Create an open extension (openTypeExtension object) and add custom properties in a new or existing instance of a resource. You can create an open extension in a resource instance and store custom data to it all in the same operation, except for specific resources. The table in the Permissions section lists the resources that support open extensions.
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
                                                    unless request_configuration.nil?
                                                        request_info.add_headers_from_raw_object(request_configuration.headers)
                                                        request_info.add_request_options(request_configuration.options)
                                                    end
                                                    request_info.set_content_from_parsable(@request_adapter, "application/json", body)
                                                    return request_info
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
        end
    end
end
