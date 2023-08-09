require 'microsoft_kiota_abstractions'
require_relative '../../../../../../../microsoft_graph'
require_relative '../../../../../../../models/o_data_errors_o_data_error'
require_relative '../../../../../../../models/security_ediscovery_index_operation'
require_relative '../../../../../../security'
require_relative '../../../../../cases'
require_relative '../../../../ediscovery_cases'
require_relative '../../../item'
require_relative '../../custodians'
require_relative '../item'
require_relative './last_index_operation'

module MicrosoftGraph
    module Security
        module Cases
            module EdiscoveryCases
                module Item
                    module Custodians
                        module Item
                            module LastIndexOperation
                                ## 
                                # Provides operations to manage the lastIndexOperation property of the microsoft.graph.security.ediscoveryCustodian entity.
                                class LastIndexOperationRequestBuilder < MicrosoftKiotaAbstractions::BaseRequestBuilder
                                    
                                    ## 
                                    ## Instantiates a new LastIndexOperationRequestBuilder and sets the default values.
                                    ## @param path_parameters Path parameters for the request
                                    ## @param request_adapter The request adapter to use to execute the requests.
                                    ## @return a void
                                    ## 
                                    def initialize(path_parameters, request_adapter)
                                        super(path_parameters, request_adapter, "{+baseurl}/security/cases/ediscoveryCases/{ediscoveryCase%2Did}/custodians/{ediscoveryCustodian%2Did}/lastIndexOperation{?%24select,%24expand}")
                                    end
                                    ## 
                                    ## Get a list of the ediscoveryIndexOperations associated with an ediscoveryCustodian.
                                    ## @param request_configuration Configuration for the request such as headers, query parameters, and middleware options.
                                    ## @return a Fiber of security_ediscovery_index_operation
                                    ## 
                                    def get(request_configuration=nil)
                                        request_info = self.to_get_request_information(
                                            request_configuration
                                        )
                                        error_mapping = Hash.new
                                        error_mapping["4XX"] = lambda {|pn| MicrosoftGraph::Models::ODataErrorsODataError.create_from_discriminator_value(pn) }
                                        error_mapping["5XX"] = lambda {|pn| MicrosoftGraph::Models::ODataErrorsODataError.create_from_discriminator_value(pn) }
                                        return @request_adapter.send_async(request_info, lambda {|pn| MicrosoftGraph::Models::SecurityEdiscoveryIndexOperation.create_from_discriminator_value(pn) }, error_mapping)
                                    end
                                    ## 
                                    ## Get a list of the ediscoveryIndexOperations associated with an ediscoveryCustodian.
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
                                    # Get a list of the ediscoveryIndexOperations associated with an ediscoveryCustodian.
                                    class LastIndexOperationRequestBuilderGetQueryParameters
                                        
                                        ## 
                                        # Expand related entities
                                        attr_accessor :expand
                                        ## 
                                        # Select properties to be returned
                                        attr_accessor :select
                                        ## 
                                        ## Maps the query parameters names to their encoded names for the URI template parsing.
                                        ## @param original_name The original query parameter name in the class.
                                        ## @return a string
                                        ## 
                                        def get_query_parameter(original_name)
                                            raise StandardError, 'original_name cannot be null' if original_name.nil?
                                            case original_name
                                                when "expand"
                                                    return "%24expand"
                                                when "select"
                                                    return "%24select"
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
    end
end
