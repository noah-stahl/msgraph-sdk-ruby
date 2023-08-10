require 'microsoft_kiota_abstractions'
require_relative '../microsoft_graph'
require_relative './models'

module MicrosoftGraph
    module Models
        class SecurityRegistryValueEvidence < MicrosoftGraph::Models::SecurityAlertEvidence
            include MicrosoftKiotaAbstractions::Parsable
            ## 
            # A unique identifier assigned to a device by Microsoft Defender for Endpoint.
            @mde_device_id
            ## 
            # Registry hive of the key that the recorded action was applied to.
            @registry_hive
            ## 
            # Registry key that the recorded action was applied to.
            @registry_key
            ## 
            # Data of the registry value that the recorded action was applied to.
            @registry_value
            ## 
            # Name of the registry value that the recorded action was applied to.
            @registry_value_name
            ## 
            # Data type, such as binary or string, of the registry value that the recorded action was applied to.
            @registry_value_type
            ## 
            ## Instantiates a new securityRegistryValueEvidence and sets the default values.
            ## @return a void
            ## 
            def initialize()
                super
                @odata_type = "#microsoft.graph.security.registryValueEvidence"
            end
            ## 
            ## Creates a new instance of the appropriate class based on discriminator value
            ## @param parse_node The parse node to use to read the discriminator value and create the object
            ## @return a security_registry_value_evidence
            ## 
            def self.create_from_discriminator_value(parse_node)
                raise StandardError, 'parse_node cannot be null' if parse_node.nil?
                return SecurityRegistryValueEvidence.new
            end
            ## 
            ## The deserialization information for the current model
            ## @return a i_dictionary
            ## 
            def get_field_deserializers()
                return super.merge({
                    "mdeDeviceId" => lambda {|n| @mde_device_id = n.get_string_value() },
                    "registryHive" => lambda {|n| @registry_hive = n.get_string_value() },
                    "registryKey" => lambda {|n| @registry_key = n.get_string_value() },
                    "registryValue" => lambda {|n| @registry_value = n.get_string_value() },
                    "registryValueName" => lambda {|n| @registry_value_name = n.get_string_value() },
                    "registryValueType" => lambda {|n| @registry_value_type = n.get_string_value() },
                })
            end
            ## 
            ## Gets the mdeDeviceId property value. A unique identifier assigned to a device by Microsoft Defender for Endpoint.
            ## @return a string
            ## 
            def mde_device_id
                return @mde_device_id
            end
            ## 
            ## Sets the mdeDeviceId property value. A unique identifier assigned to a device by Microsoft Defender for Endpoint.
            ## @param value Value to set for the mdeDeviceId property.
            ## @return a void
            ## 
            def mde_device_id=(value)
                @mde_device_id = value
            end
            ## 
            ## Gets the registryHive property value. Registry hive of the key that the recorded action was applied to.
            ## @return a string
            ## 
            def registry_hive
                return @registry_hive
            end
            ## 
            ## Sets the registryHive property value. Registry hive of the key that the recorded action was applied to.
            ## @param value Value to set for the registryHive property.
            ## @return a void
            ## 
            def registry_hive=(value)
                @registry_hive = value
            end
            ## 
            ## Gets the registryKey property value. Registry key that the recorded action was applied to.
            ## @return a string
            ## 
            def registry_key
                return @registry_key
            end
            ## 
            ## Sets the registryKey property value. Registry key that the recorded action was applied to.
            ## @param value Value to set for the registryKey property.
            ## @return a void
            ## 
            def registry_key=(value)
                @registry_key = value
            end
            ## 
            ## Gets the registryValue property value. Data of the registry value that the recorded action was applied to.
            ## @return a string
            ## 
            def registry_value
                return @registry_value
            end
            ## 
            ## Sets the registryValue property value. Data of the registry value that the recorded action was applied to.
            ## @param value Value to set for the registryValue property.
            ## @return a void
            ## 
            def registry_value=(value)
                @registry_value = value
            end
            ## 
            ## Gets the registryValueName property value. Name of the registry value that the recorded action was applied to.
            ## @return a string
            ## 
            def registry_value_name
                return @registry_value_name
            end
            ## 
            ## Sets the registryValueName property value. Name of the registry value that the recorded action was applied to.
            ## @param value Value to set for the registryValueName property.
            ## @return a void
            ## 
            def registry_value_name=(value)
                @registry_value_name = value
            end
            ## 
            ## Gets the registryValueType property value. Data type, such as binary or string, of the registry value that the recorded action was applied to.
            ## @return a string
            ## 
            def registry_value_type
                return @registry_value_type
            end
            ## 
            ## Sets the registryValueType property value. Data type, such as binary or string, of the registry value that the recorded action was applied to.
            ## @param value Value to set for the registryValueType property.
            ## @return a void
            ## 
            def registry_value_type=(value)
                @registry_value_type = value
            end
            ## 
            ## Serializes information the current object
            ## @param writer Serialization writer to use to serialize this model
            ## @return a void
            ## 
            def serialize(writer)
                raise StandardError, 'writer cannot be null' if writer.nil?
                super
                writer.write_string_value("mdeDeviceId", @mde_device_id)
                writer.write_string_value("registryHive", @registry_hive)
                writer.write_string_value("registryKey", @registry_key)
                writer.write_string_value("registryValue", @registry_value)
                writer.write_string_value("registryValueName", @registry_value_name)
                writer.write_string_value("registryValueType", @registry_value_type)
            end
        end
    end
end
