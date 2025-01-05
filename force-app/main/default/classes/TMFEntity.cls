/** 
 * Placeholder (or namespace) for TMForum entity classes
 * @author Justin Yue
 */
public virtual class TMFEntity {
    /**
     * A period of time, either as a deadline (endDateTime only) a startDateTime only, or both
     */ 
    public class TimePeriod {
        // Start of the time period, using IETC-RFC-3339 format. If you define a start, you must also define an end
        public Datetime startDateTime;
        // End of the time period, using IETC-RFC-3339 format
        public Datetime endDateTime;

    }

    /**
     * An amount in a given unit
     */ 
    public class Quantity {
        // Numeric value in a given unit
        public Decimal amount;
        // Unit
        public String units;

    }

    /**
     * A base / value business entity used to represent money
     */ 
    public class Money {
        // A positive floating point number
        public Decimal value;
        // Currency (ISO4217 norm uses 3 letters to define the currency)
        public String unit;

    }

    /**
     * Agreement reference. 
     * An agreement represents a contract or arrangement, either written or verbal and sometimes enforceable by law, such as a service level agreement 
     * or a customer price agreement. An agreement involves a number of other business entities, such as products, services, 
     * and resources and/or their specifications.
     */
    public class AgreementItemRef {
        // Unique identifier of a related entity.
        public String id;
        // Name of the related entity.
        public String name;        
        // Identifier of the agreement
        public String agreementItemId;
    }

    /**
     * BillingAccount reference. A BillingAccount is a detailed description of a bill structure.
     */
    public class BillingAccountRef {
        // Unique identifier of the billing account
        public String id;
        // Name of the billing account
        public String name;        
    }

    /**
     * Related Entity reference. A related place defines a place described by reference or by value linked to a specific entity. 
     * The polymorphic attributes @type, @schemaLocation & @referredType are related to the place entity and not the RelatedPlaceRefOrValue class itself
     */
    public class RelatedPlaceRefOrValue {
        // Unique identifier of the place
        public String id;
        //A user-friendly name for the place, such as [Paris Store], [London Store], [Main Home]
        public String name;    
        // Role of the place
        public String role;    
    }    

    /**
     * 	Describes a given characteristic of an object or entity through a name/value pair.
     */
    public virtual class Characteristic {
        // Name of the characteristic
        public String name;
        // Value of the characteristic, it can be any value type
        public String value;
        // Data type of the value of the characteristic
        public String valueType;
    }

    /**
     * ProductOffering reference. 
     * A product offering represents entities that are orderable from the provider of the catalog, this resource includes pricing information.     
     */
    public class ProductOfferingRef {
        // Unique identifier of a related entity.
        public String id;
        //Name of the related entity.
        public String name;    
    }

    /**
     * RelatedProductOrderItem (ProductOrder item) .The product order item which triggered product creation/change/termination.
     */
    public class RelatedProductOrderItem {
        // Action of the order item for this product.
        public String orderItemAction;
        // Identifier of the order item where the product was managed.
        public String orderItemId;
        // Unique identifier of a related entity.
        public String productOrderId;
        // role of the product order item for this product.
        public String role;
    }

    /**
     * Linked products to the one instantiate, such as [bundled] if the product is a bundle and you want to describe the
     * bundled products inside this bundle; [reliesOn] if the product needs another already owned product to rely on (e.g.
     * an option on an already owned mobile access product) [targets] or [isTargeted] (depending on the way of
     * expressing the link) for any other kind of links that may be useful.
     */
    public class ProductRelationship {
        // Related product
        public Product product;
        // Type of the product relationship, such as [bundled] if the product is a bundle and you want to describe the bundled products inside this bundle; 
        // [reliesOn] if the product needs another already owned product to rely on (e.g. an option on an already owned mobile access product) [targets] or 
        // [isTargeted] (depending on the way of expressing the link) for any other kind of links that may be useful
        public String relationshipType;
    }    

    /**
     * Product specification reference: A ProductSpecification is a detailed description of a tangible or intangible object made available externally 
     * in the form of a ProductOffering to customers or other parties playing a party role.
     */
    public class ProductSpecificationRef {
        // Unique identifier
        public String id;
        // Name of the related entity.
        public String name;
        // Version of the product specification
        public String version;

        public ProductSpecificationRef() {}
    }
    /**
     * @description ProductPriceOffering reference. An amount, usually of money, that is asked for or allowed when a ProductOffering is bought, rented, or leased.
     */
    public class ProductOfferingPriceRef {
        // Unique identifier
        public String id;
        // Name of the ProductOfferingPrice
        public String name;
    }

    /**
     * Service reference, for when Service is used by other entities
     */
    public class ServiceRef {
        // Unique identifier
        public String id;
        // Name of the service
        public String name;

        public ServiceRef() {}
    }

    /**
     * Resource reference, for when Resource is used by other entities
     */
    public class ResourceRef {
        // Unique identifier
        public String id;
        // Name of the resource
        public String name;
        // The resource value that can be used to identify a resource with a public key (e.g.: a tel nr, an msisdn)
        public String value;

        public ResourceRef() {}
    }

    /**
     * Related Entity reference. A related party defines party or party role linked to a specific entity.
     */ 
    public virtual class RelatedParty {
        // Unique identifier
        public String id;
        // Name of the related entity
        public String name;
        // Role played by the related party
        public String role;

    }

    /**
     * Description of a productTerm linked to this product. This represent a commitment with a duration
     */
    public class ProductTerm {
        // Description of the productTerm
        public String description;
        // Name of the productTerm
        public String name;
        // An amount in a given unit
        public Quantity duration;
        // A period of time for the productTerm to be valid
        public TimePeriod validFor;
    }

    /**
     * @description Provides all amounts (tax included, duty free, tax rate), used currency and percentage to apply for Price Alteration.
     */
    public virtual class Price {
        // Percentage to apply for ProdOfferPriceAlteration
        public Decimal percentage;
        // Tax rate
        public Decimal taxRate;
        // All taxes included amount (expressed in the given currency)
        public Money taxIncludedAmount;
        // All taxes excluded amount (expressed in the given currency)
        public Money dutyFreeAmount;
    }

    /**
     * Is an amount, usually of money, that modifies the price charged for an order item.
     */
    public virtual class PriceAlteration {
        // Duration during which the alteration applies on the order item price (for instance 2 months free of charge for the recurring charge).
        public Integer applicationDuration;
        // A narrative that explains in detail the semantics of this order item price alteration.
        public String description;
        // Name of the order item price alteration.
        public String name;
        // A category that describes the price such as recurring, one time and usage.
        public String priceType;
        // Priority level for applying this alteration among all the defined alterations on the order item price
        public Integer priority; 
        // Could be month, week...
        public String recurringChargePeriod;
        // Could be minutes, GB...
        public String unitOfMeasure;
        // Provides all amounts (tax included, duty free, tax rate), used currency and percentage to apply for Price Alteration.
        public Price price;
        // A product offering price reference (ProductOfferingPriceRef).
        public ProductOfferingPriceRef productOfferingPrice;
    }

    /**
     * An amount, usually of money, that represents the actual price paid by a Customer for a purchase, a rent or a lease of a Product. 
     * The price is valid for a defined period of time.
     */
    public class ProductPrice {
        // A narrative that explains in detail the semantics of this product price.
        public String description;
        // A short descriptive name such as "Subscription price".
        public String name;        
        // A category that describes the price, such as recurring, discount, allowance, penalty, and so forth.
        public String priceType;
        // Could be month, week...
        public String recurringChargePeriod;
        // Could be minutes, GB...
        public String unitOfMeasure;
        // A billing account reference (BillingAccountRef).
        public BillingAccountRef billingAccount;
        // Provides all amounts (tax included, duty free, tax rate), used currency and percentage to apply for Price Alteration.
        public Price price;
        
        // ProductPriceOffering reference. An amount, usually of money, that is asked for or allowed when a ProductOffering is bought, rented, or leased
        public ProductOfferingPriceRef productOfferingPrice;

        // A list of price alterations (PriceAlteration [*]). Is an amount, usually of money, that modifies the price charged for an order item.
        public PriceAlteration[] productPriceAlteration;
    }

    /**
     * A product offering procured by a customer or other interested party playing a party role. A product is realized as one or more service(s) and / or resource(s).
     */
    public virtual class Product {
        // Unique identifier of the product
        public String id;
        // Is the description of the product. It could be copied from the description of the Product Offering.
        public String description;
        // If true, the product is a ProductBundle which is an instantiation of a BundledProductOffering. If false, the product is a ProductComponent which is an instantiation of a SimpleProductOffering.
        public Boolean isBundle;
        // If true, the product is visible by the customer.
        public Boolean isCustomerVisible;
        // Name of the product. It could be the same as the name of the product offering
        public String name;
        // A date time (DateTime). Is the date when the product was ordered.
        public Datetime orderDate;
        // Is the serial number for the product. This is typically applicable to tangible products e.g. Broadband Router.
        public String productSerialNumber;
        // Is the date from which the product starts.
        public Datetime startDate;
        // Is the date when the product was terminated.
        public Datetime terminationDate;
        // A list of agreement item references (AgreementItemRef [*]). Agreement reference.
        public AgreementItemRef[] agreement;
        // A billing account reference (BillingAccountRef).
        public BillingAccountRef billingAccount;
        // A list of related place ref or values (Place [*]).
        public RelatedPlaceRefOrValue[] place;
        // public Place[] place;
        // A product to be created defined by value or existing defined by reference.
        public Product[] product;
        // Describes a given characteristic of an object or entity through a name/value pair.
        public Characteristic[] productCharacteristic;
        // A product offering reference (ProductOfferingRef).
        public ProductOfferingRef productOffering;
        // A list of related product order items (RelatedProductOrderItem [*]).
        public RelatedProductOrderItem[] productOrderItem;
        // A list of product prices (ProductPrice [*]). An amount, usually of money, that represents the actual price paid by a Customer for a purchase, a rent or a lease of a Product. The price is valid for a defined period of time.
        public ProductPrice[] productPrice;
        // A list of product relationships (ProductRelationship [*]). Linked products to the one instantiate, such as bundled, reliesOn, targets or isTargeted, ...
        public ProductRelationship[] productRelationship;
        // A product specification reference (ProductSpecificationRef). 
        public ProductSpecificationRef productSpecification;
        // Description of a productTerm linked to this product. This represent a commitment with a duration
        public ProductTerm[] productTerm;

        // Resource reference, for when Resource is used by other entities
        public ServiceRef[] realizingResource;
        // Service reference, for when Service is used by other entities
        public ResourceRef[] realizingService;

        // A list of related parties (RelatedParty [*]).
        public RelatedParty[] relatedParty;
        // A product status type (ProductStatusType). Is the lifecycle status of the product. 
        // Values: created, pendingActive, cancelled, active, pendingTerminate, terminated, suspended, aborted
        public String status;

        // 
        public Integer quantity;        
        
        public Product() {}
   }
}