
/** 
 * TMForum ProductInventory entity classes
 * @author Justin Yue
 */
public virtual class TMFProductInventoryEntity extends TMFEntity {
    public enum ProductStatusType { Created, PendingActive, Cancelled, Active, PendingTerminate, Terminated, Suspended, Aborted }

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
     * An amount, usually of money, that represents the actual price paid by a Customer for a purchase, a rent or a lease of a Product. 
     * The price is valid for a defined period of time.
     */
    public class ProductPrice extends EntityPrice { }


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
        public ProductStatusType status;

        // 
        public Integer quantity;        
        
        public Product() {}
    }

    /**
     * A product to be created defined by value or existing defined by reference. The polymorphic attributes @type, @schemaLocation & @referredType are related to the product entity and not the RelatedProductRefOrValue class itself
     */
    public class ProductRefOrValue extends Product { }
}