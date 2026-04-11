CLASS lhc_Travel DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.

    CONSTANTS:
      BEGIN OF travel_status,
        open     TYPE c LENGTH 1 VALUE 'O', " Open
        accepted TYPE c LENGTH 1 VALUE 'A', " Accepted
        rejected TYPE c LENGTH 1 VALUE 'X', " Rejeted
      END OF travel_status.

    METHODS get_instance_features FOR INSTANCE FEATURES
      IMPORTING keys REQUEST requested_features FOR Travel RESULT result.

    METHODS get_instance_authorizations FOR INSTANCE AUTHORIZATION
      IMPORTING keys REQUEST requested_authorizations FOR Travel RESULT result.

    METHODS get_global_authorizations FOR GLOBAL AUTHORIZATION
      IMPORTING REQUEST requested_authorizations FOR Travel RESULT result.

    METHODS acceptTravel FOR MODIFY
      IMPORTING keys FOR ACTION Travel~acceptTravel RESULT result.

    METHODS deductDiscount FOR MODIFY
      IMPORTING keys FOR ACTION Travel~deductDiscount RESULT result.

    METHODS reCalcTotalPrice FOR MODIFY
      IMPORTING keys FOR ACTION Travel~reCalcTotalPrice.

    METHODS rejectTravel FOR MODIFY
      IMPORTING keys FOR ACTION Travel~rejectTravel RESULT result.

    METHODS calculateTotalPrice FOR DETERMINE ON MODIFY
      IMPORTING keys FOR Travel~calculateTotalPrice.

    METHODS setStatusToOpen FOR DETERMINE ON MODIFY
      IMPORTING keys FOR Travel~setStatusToOpen.

    METHODS setTravelNumber FOR DETERMINE ON SAVE
      IMPORTING keys FOR Travel~setTravelNumber.

    METHODS validateAgency FOR VALIDATE ON SAVE
      IMPORTING keys FOR Travel~validateAgency.

    METHODS validateCustomer FOR VALIDATE ON SAVE
      IMPORTING keys FOR Travel~validateCustomer.

    METHODS validateDateRange FOR VALIDATE ON SAVE
      IMPORTING keys FOR Travel~validateDateRange.

ENDCLASS.

CLASS lhc_Travel IMPLEMENTATION.

  METHOD get_instance_features.

    " EML - Entity Manipulation Languaje
    READ ENTITIES OF Ztravel_r_c403 IN LOCAL MODE
      ENTITY Travel
      FIELDS ( OverallStatus )
      WITH CORRESPONDING #( keys )
      RESULT DATA(travels)
      FAILED failed.

    result = VALUE #( FOR travel IN travels (
                           %tky = travel-%tky
                           %field-BookingFee = COND #( WHEN travel-OverallStatus = travel_status-accepted
                                                       THEN if_abap_behv=>fc-f-read_only
                                                       ELSE if_abap_behv=>fc-f-unrestricted )
                           %action-acceptTravel = COND #( WHEN travel-OverallStatus = travel_status-accepted
                                                          THEN if_abap_behv=>fc-o-disabled
                                                          ELSE if_abap_behv=>fc-o-enabled )
                           %action-rejectTravel = COND #( WHEN travel-OverallStatus = travel_status-rejected
                                                          THEN if_abap_behv=>fc-o-disabled
                                                          ELSE if_abap_behv=>fc-o-enabled )
                           %action-deductDiscount = COND #( WHEN travel-OverallStatus = travel_status-accepted
                                                            THEN if_abap_behv=>fc-o-disabled
                                                            ELSE if_abap_behv=>fc-o-enabled )
  ) ).

  ENDMETHOD.

  METHOD get_instance_authorizations.
  ENDMETHOD.

  METHOD get_global_authorizations.
  ENDMETHOD.

  METHOD acceptTravel.

    " EML - Entity Manipulation Languaje
    MODIFY ENTITIES OF Ztravel_r_c403 IN LOCAL MODE
      ENTITY Travel
      UPDATE
      FIELDS ( OverallStatus )
      WITH VALUE #( FOR key IN keys ( %tky = key-%tky
                                      OverallStatus = travel_status-accepted  ) ).

    READ ENTITIES OF Ztravel_r_c403 IN LOCAL MODE
      ENTITY Travel
      ALL FIELDS
      WITH CORRESPONDING #( keys )
      RESULT DATA(travels).

    result = VALUE #( FOR travel IN travels ( %tky   = travel-%tky
                                              %param = travel ) ).

  ENDMETHOD.

  METHOD deductDiscount.
  ENDMETHOD.

  METHOD reCalcTotalPrice.
  ENDMETHOD.

  METHOD rejectTravel.

    " EML - Entity Manipulation Languaje
    MODIFY ENTITIES OF Ztravel_r_c403 IN LOCAL MODE
      ENTITY Travel
      UPDATE
      FIELDS ( OverallStatus )
      WITH VALUE #( FOR key IN keys ( %tky = key-%tky
                                      OverallStatus = travel_status-rejected  ) ).

    READ ENTITIES OF Ztravel_r_c403 IN LOCAL MODE
      ENTITY Travel
      ALL FIELDS
      WITH CORRESPONDING #( keys )
      RESULT DATA(travels).

    result = VALUE #( FOR travel IN travels ( %tky   = travel-%tky
                                              %param = travel ) ).

  ENDMETHOD.

  METHOD calculateTotalPrice.

    "EML
    MODIFY ENTITIES OF Ztravel_r_c403 IN LOCAL MODE
      ENTITY Travel
      EXECUTE reCalcTotalPrice
      FROM CORRESPONDING #( keys ).

  ENDMETHOD.

  METHOD setStatusToOpen.

    "EML
    READ ENTITIES OF Ztravel_r_c403 IN LOCAL MODE
       ENTITY Travel
       FIELDS ( OverallStatus )
       WITH CORRESPONDING #( keys )
       RESULT DATA(travels).

    DELETE travels WHERE OverallStatus IS NOT INITIAL.

    CHECK travels IS NOT INITIAL.

    MODIFY ENTITIES OF Ztravel_r_c403 IN LOCAL MODE
      ENTITY Travel
      UPDATE
      FIELDS ( OverallStatus )
      WITH VALUE #( FOR travel IN travels ( %tky = travel-%tky
                                            OverallStatus = travel_status-open ) ).

  ENDMETHOD.

  METHOD setTravelNumber.

    "EML
    READ ENTITIES OF Ztravel_r_c403 IN LOCAL MODE
       ENTITY Travel
       ALL FIELDS
       WITH CORRESPONDING #( keys )
       RESULT DATA(travels).

    DELETE travels WHERE TravelId IS NOT INITIAL.

    CHECK travels IS NOT INITIAL.

    SELECT SINGLE FROM ztravel_c403_a
    FIELDS MAX( travel_id )
      INTO @DATA(lv_max_travel_id).

    MODIFY ENTITIES OF Ztravel_r_c403 IN LOCAL MODE
     ENTITY Travel
     UPDATE
     FIELDS ( TravelId )
     WITH VALUE #( FOR travel IN travels INDEX INTO i
                                 ( %tky = travel-%tky
                                   TravelId = lv_max_travel_id + i ) ).

  ENDMETHOD.

  METHOD validateAgency.
  ENDMETHOD.

  METHOD validateCustomer.
  ENDMETHOD.

  METHOD validateDateRange.
  ENDMETHOD.

ENDCLASS.
