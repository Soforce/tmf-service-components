/** 
 * TMForum ProductCatalog entity classes
 * @author Justin Yue
 */
public virtual class TMFProductCatalogEntity extends TMFEntity {
    /**
     * A condition under which a ProductOffering is made available to Customers. For instance, a productOffering can be offered with multiple commitment periods.
     */
    public class ProductOfferingTerm {
        // Name of the productOfferingTerm
        public String name;
        // Description of the productOfferingTerm
        public String description;
        // A period of time, either as a deadline (endDateTime only) a startDateTime only, or both
        public TimePeriod validFor;
        // A time interval in a given unit of time
        public Duration duration;
    }

    /**
     * A collection of Product Offerings, intended for a specific DistributionChannel, enhanced with additional information 
     * such as SLA parameters, invoicing and shipping details
     */
    public virtual class ProductCatalog {
        // unique identifier
        public String id;
        // Name of the catalog
        public String name;
        // Description of the catalog
        public String description;
        // Type of this Catalog, like Product, Service, Resource etc.
        public String catalogType;
        // List of root categories contained in this catalog
        public Category[] category;
        //  A period of time, either as a deadline (endDateTime only) a startDateTime only, or both
        public TimePeriod validFor;
        // List of parties involved in this catalog
        public RelatedParty[] relatedParty;
        // Category version
        public String version;
        // Date and time of the last update
        public Datetime lastUpdate;
        // Used to indicate the current lifecycle status
        public String lifecycleStatus;
    }

    /**
     * The category resource is used to group product offerings, service and resource candidates in logical containers. Categories can contain other 
     * categories and/or product offerings, resource or service candidates.
     */
    public virtual class Category {
        // unique identifier
        public String id;
        // Name of the category
        public String name;
        //Description of the category
        public String description;
        //If true, this Boolean indicates that the category is a root of categories
        public Boolean isRoot;
        // Reference to the parent category in the catalog.
        public CategoryRef parent;
        //The category resource is used to group product offerings, service and resource candidates in logical containers. Categories can contain other (sub-)categories and/or product offerings.
        public Category[] subCategory;
        // List of product offerings that are referred to by the category
        public ProductOfferingRef[] productOffering; // Replaced with ProductOfferingRef
        //  A period of time, either as a deadline (endDateTime only) a startDateTime only, or both
        public TimePeriod validFor;
        // Category version
        public String version;
        // Date and time of the last update
        public Datetime lastUpdate;
        // Used to indicate the current lifecycle status
        public String lifecycleStatus;
    }

    /**
     * Represents entities that are orderable from the provider of the catalog, this resource includes pricing information.
     */
    public virtual class ProductOffering {
        // unique identifier
        public String id;
        // Name of the productOffering
        public String name;
        // Description of the productOffering
        public String description;
        // isBundle determines whether a productOffering represents a single productOffering (false), or a bundle of productOfferings
        public Boolean isBundle;
        // A flag indicating if this product offer can be sold stand-alone for sale or not. If this flag is false it indicates 
        // that the offer can only be sold within a bundle.
        public Boolean isSellable;
        // A string providing a complementary information on the value of the lifecycle status attribute.
        public String statusReason;
        //  A period of time, either as a deadline (endDateTime only) a startDateTime only, or both
        public TimePeriod validFor;
        // ProductOffering version
        public String version;
        // Place defines the places where the products are sold or delivered.
        public PlaceRef[] place;
        // ServiceLevelAgreement reference
        public SLARef serviceLevelAgreement;
        // The channel defines the channel for selling product offerings.
        public ChannelRef[] channel;
        // ServiceCandidate reference. ServiceCandidate is an entity that makes a ServiceSpecification available to a catalog.
        public ServiceCandidateRef serviceCandidate;
        // ResourceCandidate is an entity that makes a resource specification available to a catalog. A ResourceCandidate and its associated 
        // resource specification may be published - made visible - in any number of resource catalogs, or in none.
        public ResourceCandidateRef resourceCandidate;
        // The category resource is used to group product offerings, service and resource candidates in logical containers. 
        // Categories can contain other categories and/or product offerings, resource or service candidates.
        public CategoryRef[] category;
        // A condition under which a ProductOffering is made available to Customers. For instance, a productOffering can be offered with multiple commitment periods.
        public ProductOfferingTerm[] productOfferingTerm;
        // An amount, usually of money, that is asked for or allowed when a ProductOffering is bought, rented, or leased. The price is valid 
        // for a defined period of time and may not represent the actual price paid by a customer.
        public ProductOfferingPriceRefOrValue[] productOfferingPrice;
        // Agreement reference.
        public AgreementRef[] agreement;
        // A type of ProductOffering that belongs to a grouping of ProductOfferings made available to the market. It inherits of all attributes of ProductOffering.
        public BundledProductOffering[] bundledProductOffering;
        // A group of ProductOfferings that can be selected for instantiation, e.g. between 2 and 7 from a list of 15 channel packs.
        public BundledGroupProductOffering[] bundledGroupProductOffering;
        // Complements the description of an element (for instance a product) through video, pictures...
        public AttachmentRefOrValue[] attachment;
        // provides references to the corresponding market segment as target of product offerings. A market segment is grouping of Parties, GeographicAreas, SalesChannels, and so forth.
        public MarketSegmentRef[] marketSegment;
        // A relationship between this product offering and other product offerings.
        public ProductOfferingRelationship[] productOfferingRelationship;
        // A characteristic quality or distinctive feature of a ProductOffering. The characteristic can take on a discrete value fixed at design (catalog authoring) time, 
        // such as Mobile Plan Rank, and is not generally modifiable at inventory level.
        public CharacteristicSpecification[] productOfferingCharacteristic;
        // A use of the ProductSpecificationCharacteristicValue by a ProductOffering to which additional properties (attributes) apply or override the properties 
        // of similar properties contained in ProductSpecificationCharacteristicValue. It should be noted that characteristics which their value(s) addressed 
        // by this object must exist in corresponding product specification. The available characteristic values for a ProductSpecificationCharacteristic in a 
        // Product specification can be modified at the ProductOffering level. For example, a characteristic 'Color' might have values White, Blue, Green, and Red. 
        // But, the list of values can be restricted to e.g. White and Blue in an associated product offering. It should be noted that the list of values 
        // in 'ProductSpecificationCharacteristicValueUse' is a strict subset of the list of values as defined in the corresponding product specification characteristics.
        public ProductSpecificationCharacteristicValueUse[] prodSpecCharValueUse;
        // The Policy resource represents a policy/rule applied to ProductOffering.
        public PolicyRef[] policy;
        // List of actions that can be executed (in context of a product order) on products instantiated from this offering
        public AllowedProductAction[] allowedAction;
        // Date and time of the last update
        public Datetime lastUpdate;
        // Used to indicate the current lifecycle status
        public String lifecycleStatus;
        // ProductSpecification reference.
        public ProductSpecificationRef productSpecification;
        // List of external identifieers for the offering, e.g. identifier in source catalog
        public ExternalIdentifier[] externalIdentifier;
    }    

    /**
     * Represents a containment of a product offering within another product offering, including specification of cardinality (e.g. is the bundled offering 
     * mandatory, how many times can it be instantiated in the parent product, etc.).
     */
    public class BundledProductOffering {
        // Locally unique identifier of the group, useful in case the parent product offering or group includes multiple groups.
        public String id;
        // The name of the group of child offerings. Required to distinguish several choice groups.
        public String name;
        // BundledProductOffering version
        public String version;        
        // Child offerings, from which instances can be created as direct or hierarchically indirect children of the parent offering.
        public BundledProductOffering[] bundledProductOffering;
        // Child groups of product offerings, to enable hierarchical sub-grouping.
        public BundledGroupProductOffering[] bundledGroupProductOffering;
        // A set of numbers that specifies the lower and upper limits for a ProductOffering that can be procured as part of 
        // the related BundledProductOffering. Values can range from 0 to unbounded
        public BundledProductOfferingOption bundledProductOfferingOption;
    }

    /**
     * A group of product offerings that can be chosen for instantiation of children of the parent product offering, for example a list of channels 
     * for selection under a TV offering. Sometimes known as Selection Group. The group can also hierarchically contain other groups
     */
    public class BundledGroupProductOffering {
        // Locally unique identifier of the group, useful in case the parent product offering or group includes multiple groups.
        public String id;
        // The name of the group of child offerings. Required to distinguish several choice groups.
        public String name;
        // Child offerings, from which instances can be created as direct or hierarchically indirect children of the parent offering.
        public BundledProductOffering[] bundledProductOffering;
        // Child groups of product offerings, to enable hierarchical sub-grouping.
        public BundledGroupProductOffering[] bundledGroupProductOffering;
        // Defines for a BundledProductOfferingGroup (i.e. a group of multiple child offerings of a parent product offering), how many instances from the child offerings can be chosen in total. 
        // For example facilitate the choice of between 2 and 7 channel packs from a list, and cause certain items to be selected by default
        public BundledGroupProductOfferingOption bundledGroupProductOfferingOption;
    }

    /**
     * Is based on both the basic cost to develop and produce products and the enterprises policy on revenue targets. This price may be further revised through 
     * discounting (a Product Offering Price that reflects an alteration). The price, applied for a productOffering may also be influenced by the productOfferingTerm, 
     * the customer selected, eg: a productOffering can be offered with multiple terms, like commitment periods for the contract. The price may be influenced 
     * by this productOfferingTerm. A productOffering may be cheaper with a 24 month commitment than with a 12 month commitment.
     */
    public class ProductOfferingPrice extends ProductOfferingPriceRefOrValue {
        // Description of the productOfferingPrice
        public String description;
        //  A period of time, either as a deadline (endDateTime only) a startDateTime only, or both
        public TimePeriod validFor;
        // An amount in a given unit
        public Quantity unitOfMeasure;
        // The period to repeat the application of the price Could be month, week...
        public String recurringChargePeriodType;
        // the period of the recurring charge: 1, 2, ... .It sets to zero if it is not applicable
        public Integer recurringChargePeriodLength;
        // A flag indicating if this ProductOfferingPrice is composite (bundle) or not
        public Boolean isBundle;
        // A base / value business entity used to represent money
        public Money price;
        // Percentage to apply if this Product Offering Price is an Alteration (such as a Discount)
        public Decimal percentage;
        // represents a bundle relationship from a bundle product offering price (parent) to a simple product offering price (child). A simple product offering price may participate in more than one bundle relationship.
        public BundledProductOfferingPriceRelationship[] bundledPopRelationship;
        // Product Offering Prices related to this Product Offering Price, for example a price alteration such as allowance or discount
        public ProductOfferingPriceRelationship[] popRelationship;
        // A use of the ProductSpecificationCharacteristicValue by a ProductOfferingPrice to which additional properties (attributes) apply or override the properties of similar properties contained in ProductSpecificationCharacteristicValue.
        public ProductSpecificationCharacteristicValueUse[] prodSpecCharValueUse;
        // A list of conditions under which a ProductOfferingPrice is made available to Customers. For instance, a Product Offering Price can be offered with multiple commitment periods.
        public ProductOfferingTerm[] productOfferingTerm;
        // Place defines the places where the products are sold or delivered.
        public PlaceRef[] place;
        // The Policy resource represents a policy/rule applied to ProductOfferingPrice.
        public PolicyRef[] policy;
        // The PricingLogicAlgorithm entity represents an instantiation of an interface specification to external rating function (without a modeled behavior in SID). Some of the parameters of the interface definition may be already set (such as price per unit) and some may be gathered during the rating process from the event (such as call duration) or from ProductCharacteristicValues (such as assigned bandwidth).
        public PricingLogicAlgorithm[] pricingLogicAlgorithm;
        // An amount of money levied on the price of a Product by a legislative body.
        public TaxItem[] tax;
        // A category that describes the price, such as recurring, discount, allowance, penalty, and so forth.
        public String priceType;
        // Date and time of the last update
        public Datetime lastUpdate;
        // Used to indicate the current lifecycle status
        public String lifecycleStatus;
        // List of external identifieers for the offering, e.g. identifier in source catalog
        public ExternalIdentifier[] externalIdentifier;
    }

    /**
     * Is a detailed description of a tangible or intangible object made available externally in the form 
     * of a ProductOffering to customers or other parties playing a party role.
     */
    public class ProductSpecification {
        // unique identifier
        public String id;
        // The manufacturer or trademark of the specification
        public String brand;
        // Name of the product specification
        public String name;
        // A narrative that explains in detail what the product specification is
        public String description;
        // isBundle determines whether a productOffering represents a single productOffering (false), or a bundle of productOfferings
        public Boolean isBundle;
        // An identification number assigned to uniquely identity the specification
        public String productNumber;
        // The category resource is used to group product specifications in logical containers. Categories can contain other categories and/or other catalog entries.
        public CategoryRef[] category;
        //  A period of time, either as a deadline (endDateTime only) a startDateTime only, or both
        public TimePeriod validFor;
        // Product specification version
        public String version;
        // A related party defines party or party role linked to a specific entity.
        public RelatedPartyRefOrPartyRoleRef[] relatedParty;
        // A characteristic quality or distinctive feature of a ProductSpecification.
        public CharacteristicSpecification[] productSpecCharacteristic;
        // ServiceSpecification(s) required to realize a ProductSpecification.
        public ServiceSpecificationRef[] serviceSpecification;
        // The ResourceSpecification is required to realize a ProductSpecification.
        public ResourceSpecificationRef[] resourceSpecification;
        // A type of ProductSpecification that belongs to a grouping of ProductSpecifications made available to the market. It inherits of all attributes of ProductSpecification.
        public BundledProductSpecification[] bundledProductSpecification;
        // A migration, substitution, dependency or exclusivity relationship between/among product specifications.
        public ProductSpecificationRelationship[] productSpecificationRelationship;
        // Complements the description of an element (for instance a product) through video, pictures...
        public AttachmentRefOrValue[] attachment;
        // The Policy resource represents a policy/rule applied to ProductSpecification.
        public PolicyRef[] policy;
        // Date and time of the last update
        public Datetime lastUpdate;
        // Used to indicate the current lifecycle status
        public String lifecycleStatus;
        // List of external identifieers for the offering, e.g. identifier in source catalog
        public ExternalIdentifier[] externalIdentifier;
    }

    /**
     * This class defines a characteristic specification.
     */
    public class CharacteristicSpecification {
        // unique identifier
        public String id;
        // A word, term, or phrase by which this characteristic specification is known and distinguished from other characteristic specifications.
        public String name;
        // A narrative that explains the CharacteristicSpecification.
        public String description;
        // A kind of value that the characteristic can take on, such as numeric, text and so forth
        public String valueType;
        // A period of time, either as a deadline (endDateTime only) a startDateTime only, or both
        public TimePeriod validFor;
        // The minimum number of instances a CharacteristicValue can take on. For example, zero to five phone numbers in a group calling plan, where zero is the value for the minCardinality.
        public Integer minCardinality;
        // The maximum number of instances a CharacteristicValue can take on. For example, zero to five phone numbers in a group calling plan, where five is the value for the maxCardinality.
        public Integer maxCardinality;
        // Specifies if the value of this characteristic is unique across all entities instantiated from the specification that uses this characteristc. For example, consider a ProductSpecification for a set-top box, with a CharacteristicSpecification cardID. Each set-top box must have a different value for cardID, so this isUnique attribute would be set to true for the characteristic.
        public boolean isUnique;
        // A rule or principle represented in regular expression used to derive the value of a characteristic value.
        public String regex;
        // An indicator that specifies that the values for the characteristic can be extended by adding new values when instantiating a characteristic for a resource.
        public boolean extensible;
        // An aggregation, migration, substitution, dependency or exclusivity relationship between/among Specification Characteristics.
        public CharacteristicSpecificationRelationship[] charSpecRelationship;
        // A CharacteristicValueSpecification object is used to define a set of attributes, each of which can be assigned to a corresponding set of attributes in a CharacteristicSpecification object.
        public CharacteristicValueSpecification[] characteristicValueSpecification;
    }

    /**
     * A type of ProductSpecification that belongs to a grouping of ProductSpecifications made available to the market. It inherits of all attributes of ProductSpecification.
     */
    public class BundledProductSpecification {
        // Unique identifier of the product specification
        public String id;
        // Name of the product specification
        public String name;
        // Used to indicate the current lifecycle status
        public String lifecycleStatus;
        // Version of the product specification
        public String version;        
    }
    /**
     * A CharacteristicValueSpecification object is used to define a set of attributes, each of which can be assigned to a corresponding set of attributes 
     * in a CharacteristicSpecification object. The values of the attributes in the CharacteristicValueSpecification object describe the values of the 
     * attributes that a corresponding Characteristic object can take on.
     */
    public class CharacteristicValueSpecification {
        // A kind of value that the characteristic value can take on, such as numeric, text and so forth
        public String valueType;
        // A period of time, either as a deadline (endDateTime only) a startDateTime only, or both
        public TimePeriod validFor;
        // A length, surface, volume, dry measure, liquid measure, money, weight, time, and the like. In general, a determinate quantity or magnitude of the kind designated, taken as a standard of comparison for others of the same kind, in assigning to them numerical values, as 1 foot, 1 yard, 1 mile, 1 square foot.
        public String unitOfMeasure;
        // If true, the Boolean Indicates if the value is the default value for a characteristic
        public Boolean isDefault;
        // The low range value that a characteristic can take on
        public Integer valueFrom;
        // The upper range value that a characteristic can take on
        public Integer valueTo;
        // An indicator that specifies the inclusion or exclusion of the valueFrom and valueTo attributes. If applicable, possible values are "open", "closed", "closedBottom" and "closedTop".
        public String rangeInterval;
        // A regular expression constraint for given value
        public String regex;

    }

    /**
     * A relationship between two product Offerings.
     */
    public class ProductOfferingRelationship extends EntityRelationship {
        // The association role for the source product offering
        public String role;
        //  A period of time, either as a deadline (endDateTime only) a startDateTime only, or both
        public TimePeriod validFor;
        // Product specification version
        public String version;
    }

    /**
     * Describes a non-composite relationship between product offering prices. For example one price might be an discount alteration for another price
     */
    public class ProductOfferingPriceRelationship extends EntityRelationship {
        // The association role for the source product offering price
        public String role;
        // Product specification version
        public String version;
    }

    /**
     * This represents a bundling pricing relationship, allowing a price to be composed of multiple other prices (e.g. a recurring charge and a onetime charge).
     */
    public class BundledProductOfferingPriceRelationship extends EntityRelationship {
        // Product specification version
        public String version;
    }   
    
    /**
     * A migration, substitution, dependency or exclusivity relationship between/among product specifications.
     */
    public class ProductSpecificationRelationship extends EntityRelationship {
        //  A period of time, either as a deadline (endDateTime only) a startDateTime only, or both
        public TimePeriod validFor;
        // Version of the referred product specification.
        public String version;
        // A characteristic that refines the relationship. For example, consider the relationship between broadband and TV. For a 4k TV it is important to know the minimum bandwidth 
        // to support 4k, so a characteristic Resolution might be defined on the relationship to allow capturing of this in the inventory
        public CharacteristicSpecification[] characteristic;
    }       

    /**
     * An aggregation, migration, substitution, dependency or exclusivity relationship between/among Characteristic specifications. The specification characteristic 
     * is embedded within the specification whose ID and href are in this entity, and identified by its ID.
     */
    public class CharacteristicSpecificationRelationship {
        // Name of the target characteristic within the specification
        public String name;
        // Type of relationship such as aggregation, migration, substitution, dependency, exclusivity
        public String relationshipType;
        // Unique identifier of the characteristic within the specification
        public String characteristicSpecificationId;
        // Unique identifier of the parent specification containing the target characteristic
        public String parentSpecificationId;
        //  A period of time, either as a deadline (endDateTime only) a startDateTime only, or both
        public TimePeriod validFor;
    }

    /**
     * Defines an action that can be taken on a product in the inventory as part of a product order. It is expected that this entity will be attached to product catalog items 
     * such as specifications and offerings
     */
    public class AllowedProductAction {
        // A list of sales channels in which this action is allowed; for instance Remove might be allowed only in an assisted channel not in a self-service channel
        public ChannelRef[] channel;
        // The name of the action, example add
        public String action;
        //  A period of time, either as a deadline (endDateTime only) a startDateTime only, or both
        public TimePeriod validFor;
    }

    /**
     * The PricingLogicAlgorithm entity represents an instantiation of an interface specification to external rating function (without a modeled bahavior in SID). Some of the parameters of the 
     * interface definiition may be already set (such as price per unit) and some may be gathered during the rating process from the event (such as call duration) or from 
     * ProductCharacteristicValues (such as assigned bandwidth)
     */
    public class PricingLogicAlgorithm {
        // unique identifier
        public String id;
        // Name given to the PricingLogicAlgorithm
        public String name;
        // description given to the PricingLogicAlgorithm
        public String description;
        // id of corresponding PricingLogicAlgorithm specification
        public String plaSpecId;
        // A period of time, either as a deadline (endDateTime only) a startDateTime only, or both
        public TimePeriod validFor;
    }

    /**
     * A set of numbers that specifies the lower and upper limits for a ProductOffering that can be procured as part of the related BundledProductOffering. Values can range from 0 to unbounded
     */
    public class BundledProductOfferingOption {
        // Default number of produc offereings that should be procured as part of the related BundledProductOffering
        public Integer numberRelOfferDefault;
        // lower limit for a product offering that can be procured as part of the related BundledProductOffering
        public Integer numberRelOfferLowerLimit;
        // upper limit for a product offering that can be procured as part of the related BundledProductOffering
        public Integer numberRelOfferUpperLimit;
    }

    /**
     * Defines for a BundledProductOfferingGroup (i.e. a group of multiple child offerings of a parent product offering), how many instances from the child offerings can be chosen in total. 
     * For example facilitate the choice of between 2 and 7 channel packs from a list, and cause certain items to be selected by default
     */
    public class BundledGroupProductOfferingOption {
        // The minimum total number of instances of the child offerings directly of hierarchically in the group that should be instantiated
        public Integer numberRelOfferLowerLimit;
        // The maximum total number of instances of the child offerings directly of hierarchically in the group that should be instantiated
        public Integer numberRelOfferUpperLimit;
    }  
    
    /**
     * A use of the ProductSpecificationCharacteristicValue by a ProductOffering to which additional properties (attributes) apply or override the properties of similar properties 
     * contained in ProductSpecificationCharacteristicValue. It should be noted that characteristics which their value(s) addressed by this object must exist in corresponding product 
     * specification. The available characteristic values for a ProductSpecificationCharacteristic in a Product specification can be modified at the ProductOffering level. 
     * For example, a characteristic 'Color' might have values White, Blue, Green, and Red. But, the list of values can be restricted to e.g. White and Blue in an associated product offering. 
     * It should be noted that the list of values in 'ProductSpecificationCharacteristicValueUse' is a strict subset of the list of values as defined in the corresponding product 
     * specification characteristics.
     */
    public class ProductSpecificationCharacteristicValueUse {
        // Unique ID for the characteristic
        public String id;
        // Name of the associated productSpecificationCharacteristic
        public String name;
        // A narrative that explains in detail what the productSpecificationCharacteristic is
        public String description;
        // A kind of value that the characteristic can take on, such as numeric, text and so forth
        public String valueType;
        // The minimum number of instances a CharacteristicValue can take on. For example, zero to five phone numbers in a group calling plan, where zero is the value for the minCardinality.
        public Integer minCardinality;
        // The maximum number of instances a CharacteristicValue can take on. For example, zero to five phone numbers in a group calling plan, where five is the value for the maxCardinality.
        public Integer maxCardinality;
        // A period of time, either as a deadline (endDateTime only) a startDateTime only, or both
        public TimePeriod validFor;
        // A number or text that can be assigned to a ProductSpecificationCharacteristic.
        public CharacteristicValueSpecification[] productSpecCharacteristicValue;
        // ProductSpecification reference. 
        public ProductSpecificationRef productSpecification;
    }
}