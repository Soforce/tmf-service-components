/** 
 * TMForum base entity classes
 * @author Justin Yue
 */
public virtual class TMFEntity {
    public enum ItemActionType { Add, Modify, Disconnect, NoChange }

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
     * Extra information about a given entity
     */
    public class Note {
        // Identifier of the note within its containing entity
        public String id;
        // Author of the note
        public String author;
        // Date of the note
        public Datetime noteDate;
        // Text of the note
        public String text;
    }

    /**
     * Base Entity Reference class
     */
    public virtual class EntityRef {
        // Unique identifier of a related entity.
        public String id;
        // Name of the related entity.
        public String name;        
    }

    /**
     * Agreement reference. 
     */
    public class AgreementRef extends EntityRef { }

    /**
     * Agreement reference. 
     */
    public class AgreementItemRef extends EntityRef { }

    /**
     * Refers an appointment, such as a Customer presentation or internal meeting or site visit
     */
    public class AppointmentRef {
        // Unique identifier of a related entity.
        public String id;
        // An explanatory text regarding the appointment made with a party.
        public String description;        
    }

    /**
     * ServiceLevelAgreement reference. 
     */
    public class SLARef extends EntityRef { }

    /**
     * ServiceCandidate reference. ServiceCandidate is an entity that makes a ServiceSpecification available to a catalog.
     */
    public class ServiceCandidateRef extends EntityRef { }

    /**
     * ResourceCandidate is an entity that makes a resource specification available to a catalog. A ResourceCandidate and its associated resource 
     * specification may be published - made visible - in any number of resource catalogs, or in none.
     */
    public class ResourceCandidateRef extends EntityRef { }

    /**
     * The channel to which the resource reference to. e.g. channel for selling product offerings, channel for opening a trouble ticket etc. 
     */
    public class ChannelRef extends EntityRef { }

    /**
     * provides references to the corresponding market segment as target of product offerings. 
     * A market segment is grouping of Parties, GeographicAreas, SalesChannels, and so forth.
     */
    public class MarketSegmentRef extends EntityRef { }


    /**
     * Policy reference. 
     */
    public class PlaceRef extends EntityRef { }

    /**
     * Place reference. 
     */
    public class PolicyRef extends EntityRef { }

    /**
     * Payment reference. 
     */
    public class PaymentRef extends EntityRef { }

    /**
     * Reference to a category in the catalog.
     */
    public class CategoryRef extends EntityRef {
        // Version of the category
        public String version;
    }

    /**
     * RelatedParty reference. A related party defines party or party role or its reference, linked to a specific entity
     */
    public class RelatedPartyRefOrPartyRoleRef {
        // Role played by the related party or party role in the context of the specific entity it is linked to. Such as 'initiator', 'customer', 'salesAgent', 'user'
        public String role;
        // A Party or party role reference
        public PartyRefOrPartyRoleRef partyOrPartyRole;
    }

    /**
     * A Party or party role reference
     */
    public virtual class PartyRefOrPartyRoleRef extends EntityRef {}

    /**
     * A Party reference
     */
    public class PartyRef extends PartyRefOrPartyRoleRef {}

    /**
     * A Party role reference
     */
    public class PartyRoleRef extends PartyRefOrPartyRoleRef {
        // The identifier of the engaged party that is linked to the PartyRole object.
        public String partyId;
        // The name of the engaged party that is linked to the PartyRole object.
        public String partyName;
    }


    /**
     * one of ProductOfferingPrice or ProductOfferingPriceRef
     */
    public virtual class ProductOfferingPriceRef extends ProductOfferingPriceRefOrValue {}

    /**
     * ProductPriceOffering reference. An amount, usually of money, that is asked for or allowed when a ProductOffering is bought, rented, or leased
     */
    public virtual class ProductOfferingPriceRefOrValue extends EntityRef {
        // Version of the category
        public String version;
    }

    /**
     * ServiceSpecification reference.
     */
    public class ServiceSpecificationRef extends EntityRef {
        // Version of the category
        public String version;
    }

    /**
     * ResourceSpecification reference.
     */
    public class ResourceSpecificationRef extends EntityRef {
        // Version of the category
        public String version;
    }

    /**
     * ProductOffering reference.
     */
    public class ProductOfferingRef extends EntityRef {
        // Version of the category
        public String version;
    }

    /**
     * Quote reference. 
     */
    public class QuoteRef extends EntityRef { }

    /**
     * QuoteItem reference. 
     */
    public class QuoteItemRef extends EntityRef { }
    
    /**
     * ProductOfferingQualification reference. 
     */
    public class ProductOfferingQualificationRef extends EntityRef { }

    /**
     * It's a productOfferingQualification item that has been executed previously.
     */
    public class ProductOfferingQualificationItemRef extends EntityRef { 
        // Unique identifier of a related entity.
        public String productOfferingQualificationId;
        // Name of the related entity.
        public String productOfferingQualificationName;

    }

    /** 
     * Complements the description of an element (for instance a product) through video, pictures...
     * Oneof: Attachment or AttachmentRef
     */
    public virtual class AttachmentRefOrValue extends EntityRef {}

    /**
     * Attachment reference
     */
    public class AttachmentRef extends AttachmentRefOrValue {}

    /**
     * Complements the description of an element (for instance a product) through video, pictures...
     */
    public class Attachment extends AttachmentRefOrValue {
        // A narrative text describing the content of the attachment
        public String description;
        // The actual contents of the attachment object, if embedded, encoded as base64
        public Blob content;
        // Uniform Resource Locator, is a web page address (a subset of URI)
        public String url;
        // An amount in a given unit
        public Quantity size;
        // A period of time, either as a deadline (endDateTime only) a startDateTime only, or both
        public TimePeriod validFor;
        // a business characterization of the purpose of the attachment, for example logo, instructionManual, contractCopy
        public String attachmentType;
        // a technical characterization of the attachment content format using IETF Mime Types
        public String mimeType;
    }

    /**
     * BillingAccount reference. A BillingAccount is a detailed description of a bill structure.
     */
    public class BillingAccountRef extends EntityRef { }

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
     * An identification of an entity that is owned by or originates in a software system different from the current system, for example a ProductOrder 
     * handed off from a commerce platform into an order handling system. The structure identifies the system itself, the nature of the entity within the 
     * system (e.g. class name) and the unique ID of the entity within the system. It is anticipated that multiple external IDs can be held for a single entity, 
     * e.g. if the entity passed through multiple systems on the way to the current system. In this case the consumer is expected to sequence the IDs in the 
     * array in reverse order of provenance, i.e. most recent system first in the list.
     */
    public class ExternalIdentifier {
        // identification of the entity within the external system.
        public String id;
        // Type of the identification, typically would be the type of the entity within the external system
        public String externalIdentifierType;    
        // Name of the external system that owns the entity.
        public String owner;    
    }

    /**
     * Related channel to another entity. May be online web, mobile app, social ,etc
     */
    public class RelatedChannel {
        // Unique identifier 
        public String id;
        // Name of the channel.
        public String name;    
    }    

    /**
     * A tax item is created for each tax rate and tax type used in the bill.
     */
    public class TaxItem {
        // A base / value business entity used to represent money
        public Money taxAmount;
        // Applied rate of the tax
        public Decimal taxRate;
        // Tax category
        public String taxCategory;
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
     * A time interval in a given unit of time
     */
    public class Duration {
        // Time interval (number of seconds, minutes, hours, etc.)
        public Integer amount;
        // Unit of time (seconds, minutes, hours, etc.)
        public String units;
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
     * Service reference, for when Service is used by other entities
     */
    public class ServiceRef extends EntityRef { }

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
     * Indicates the contact medium that could be used to contact the party.
     */
    public class ContactMedium {
        // Unique identifier
        public String id;
        // If true, indicates that is the preferred contact medium
        public Boolean preferred;
        // Type of the contact medium to qualifiy it like pro email / personal email. This is not used to define the contact medium used.
        public String contactType;
        // A period of time, either as a deadline (endDateTime only) a startDateTime only, or both
        public TimePeriod validFor;
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
    public abstract class EntityPrice {
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
     * Base entity relationship class
     */
    public abstract class EntityRelationship {
        // The id of entity relationship
        public String id;
        // The name of entity relationship
        public String name;
        // The type of entity relationship
        public String relationshipType;
    } 
}