require 'microsoft_kiota_abstractions'
require_relative '../../../../../../../microsoft_graph'
require_relative '../../../../../../../models/json'
require_relative '../../../../../../drives'
require_relative '../../../../../item'
require_relative '../../../../items'
require_relative '../../../item'
require_relative '../../workbook'
require_relative '../functions'
require_relative './tbill_yield'

module MicrosoftGraph
    module Drives
        module Item
            module Items
                module Item
                    module Workbook
                        module Functions
                            module TbillYield
                                class TbillYieldPostRequestBody
                                    include MicrosoftKiotaAbstractions::AdditionalDataHolder, MicrosoftKiotaAbstractions::Parsable
                                    ## 
                                    # Stores additional data not described in the OpenAPI description found when deserializing. Can be used for serialization as well.
                                    @additional_data
                                    ## 
                                    # The maturity property
                                    @maturity
                                    ## 
                                    # The pr property
                                    @pr
                                    ## 
                                    # The settlement property
                                    @settlement
                                    ## 
                                    ## Gets the additionalData property value. Stores additional data not described in the OpenAPI description found when deserializing. Can be used for serialization as well.
                                    ## @return a i_dictionary
                                    ## 
                                    def additional_data
                                        return @additional_data
                                    end
                                    ## 
                                    ## Sets the additionalData property value. Stores additional data not described in the OpenAPI description found when deserializing. Can be used for serialization as well.
                                    ## @param value Value to set for the additionalData property.
                                    ## @return a void
                                    ## 
                                    def additional_data=(value)
                                        @additional_data = value
                                    end
                                    ## 
                                    ## Instantiates a new tbillYieldPostRequestBody and sets the default values.
                                    ## @return a void
                                    ## 
                                    def initialize()
                                        @additional_data = Hash.new
                                    end
                                    ## 
                                    ## Creates a new instance of the appropriate class based on discriminator value
                                    ## @param parse_node The parse node to use to read the discriminator value and create the object
                                    ## @return a tbill_yield_post_request_body
                                    ## 
                                    def self.create_from_discriminator_value(parse_node)
                                        raise StandardError, 'parse_node cannot be null' if parse_node.nil?
                                        return TbillYieldPostRequestBody.new
                                    end
                                    ## 
                                    ## The deserialization information for the current model
                                    ## @return a i_dictionary
                                    ## 
                                    def get_field_deserializers()
                                        return {
                                            "maturity" => lambda {|n| @maturity = n.get_object_value(lambda {|pn| MicrosoftGraph::Models::Json.create_from_discriminator_value(pn) }) },
                                            "pr" => lambda {|n| @pr = n.get_object_value(lambda {|pn| MicrosoftGraph::Models::Json.create_from_discriminator_value(pn) }) },
                                            "settlement" => lambda {|n| @settlement = n.get_object_value(lambda {|pn| MicrosoftGraph::Models::Json.create_from_discriminator_value(pn) }) },
                                        }
                                    end
                                    ## 
                                    ## Gets the maturity property value. The maturity property
                                    ## @return a json
                                    ## 
                                    def maturity
                                        return @maturity
                                    end
                                    ## 
                                    ## Sets the maturity property value. The maturity property
                                    ## @param value Value to set for the maturity property.
                                    ## @return a void
                                    ## 
                                    def maturity=(value)
                                        @maturity = value
                                    end
                                    ## 
                                    ## Gets the pr property value. The pr property
                                    ## @return a json
                                    ## 
                                    def pr
                                        return @pr
                                    end
                                    ## 
                                    ## Sets the pr property value. The pr property
                                    ## @param value Value to set for the pr property.
                                    ## @return a void
                                    ## 
                                    def pr=(value)
                                        @pr = value
                                    end
                                    ## 
                                    ## Serializes information the current object
                                    ## @param writer Serialization writer to use to serialize this model
                                    ## @return a void
                                    ## 
                                    def serialize(writer)
                                        raise StandardError, 'writer cannot be null' if writer.nil?
                                        writer.write_object_value("maturity", @maturity)
                                        writer.write_object_value("pr", @pr)
                                        writer.write_object_value("settlement", @settlement)
                                        writer.write_additional_data(@additional_data)
                                    end
                                    ## 
                                    ## Gets the settlement property value. The settlement property
                                    ## @return a json
                                    ## 
                                    def settlement
                                        return @settlement
                                    end
                                    ## 
                                    ## Sets the settlement property value. The settlement property
                                    ## @param value Value to set for the settlement property.
                                    ## @return a void
                                    ## 
                                    def settlement=(value)
                                        @settlement = value
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
