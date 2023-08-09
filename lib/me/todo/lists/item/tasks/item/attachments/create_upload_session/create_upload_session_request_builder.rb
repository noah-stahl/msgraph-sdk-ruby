require 'microsoft_kiota_abstractions'
require_relative '../../../../../../../../microsoft_graph'
require_relative '../../../../../../../../models/o_data_errors_o_data_error'
require_relative '../../../../../../../../models/upload_session'
require_relative '../../../../../../../me'
require_relative '../../../../../../todo'
require_relative '../../../../../lists'
require_relative '../../../../item'
require_relative '../../../tasks'
require_relative '../../item'
require_relative '../attachments'
require_relative './create_upload_session'

module MicrosoftGraph
    module Me
        module Todo
            module Lists
                module Item
                    module Tasks
                        module Item
                            module Attachments
                                module CreateUploadSession
                                    ## 
                                    # Provides operations to call the createUploadSession method.
                                    class CreateUploadSessionRequestBuilder < MicrosoftKiotaAbstractions::BaseRequestBuilder
                                        
                                        ## 
                                        ## Instantiates a new CreateUploadSessionRequestBuilder and sets the default values.
                                        ## @param path_parameters Path parameters for the request
                                        ## @param request_adapter The request adapter to use to execute the requests.
                                        ## @return a void
                                        ## 
                                        def initialize(path_parameters, request_adapter)
                                            super(path_parameters, request_adapter, "{+baseurl}/me/todo/lists/{todoTaskList%2Did}/tasks/{todoTask%2Did}/attachments/createUploadSession")
                                        end
                                        ## 
                                        ## Create an upload session to iteratively upload ranges of a file as an attachment to a todoTask. As part of the response, this action returns an upload URL that you can use in subsequent sequential PUT queries. The request headers for each PUT operation let you specify the exact range of bytes to be uploaded. This allows the transfer to be resumed, in case the network connection is dropped during the upload. The following are the steps to attach a file to a Microsoft To Do task using an upload session: For an example that describes the end-to-end attachment process, see attach files to a To Do task.
                                        ## @param body The request body
                                        ## @param request_configuration Configuration for the request such as headers, query parameters, and middleware options.
                                        ## @return a Fiber of upload_session
                                        ## 
                                        def post(body, request_configuration=nil)
                                            raise StandardError, 'body cannot be null' if body.nil?
                                            request_info = self.to_post_request_information(
                                                body, request_configuration
                                            )
                                            error_mapping = Hash.new
                                            error_mapping["4XX"] = lambda {|pn| MicrosoftGraph::Models::ODataErrorsODataError.create_from_discriminator_value(pn) }
                                            error_mapping["5XX"] = lambda {|pn| MicrosoftGraph::Models::ODataErrorsODataError.create_from_discriminator_value(pn) }
                                            return @request_adapter.send_async(request_info, lambda {|pn| MicrosoftGraph::Models::UploadSession.create_from_discriminator_value(pn) }, error_mapping)
                                        end
                                        ## 
                                        ## Create an upload session to iteratively upload ranges of a file as an attachment to a todoTask. As part of the response, this action returns an upload URL that you can use in subsequent sequential PUT queries. The request headers for each PUT operation let you specify the exact range of bytes to be uploaded. This allows the transfer to be resumed, in case the network connection is dropped during the upload. The following are the steps to attach a file to a Microsoft To Do task using an upload session: For an example that describes the end-to-end attachment process, see attach files to a To Do task.
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
