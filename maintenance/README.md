1##- For Technician
     +ComplainFixScreen





#CM DATABASE
{
    id: ,
    date: ,
    branch: 'autobahan' ,
    type_complaint: ,
    complainer_name: ,
    technician_name: ,
    technician_num: ,
    complaint_desc: ,
    first_coordinate: {
        latitude: '4354363',
        longitude: '9086490',
    }
    last_coordinate: {
        latitude: '4354363',
        longitude: '9086490',
    }
    photos: [],
}

#PM DATABASE
{
    id: ,
    date: ,
    branch: 'autobahan' ,
    ups: {
        wiring_condition: ,
        load: ,
        error: ,
        battery_water: ,
        battery_terminal: ,
        battery_charging: ,
        overall_condition: ,
    },
    generator:{
        battery_water: ,
        battery_charging: ,
        battery_terminal: ,
        fuel: ,
        radiator_water:,
        mobil_oil: ,
        ignition_self: , 
        cleaning_inside_outside: ,
        phase_voltage_check: ,
        generator_meter_reading: ,
        wapda_meter_reading: ,
        overall_condition: ,
    }
    chillers: {
        temperature_check:,
        lights:,
        leakage:,
        glass_shelves:,
        top_glasses:,
        railing_door:,
        drain_line:,
        cleaning:,
        over_all_condition:,
    }
    air_conditoner: {
        temperature_check:,
        error:,
        filter:,
        drain_line:,
        cleaning:,
        over_all_condition:, 
    }
    other_accessories:{
        air_cutter:,
        insect_killer:,
        micowave_oven:,
        led_tv:,
        water_motor_pump:,
        bathroom_fixture_and_tank:,
    }
    glass_work_and_branch_cleaning:{
        windows:,
        main_door:,
        biscuits_section_glass:,
        biscuits_section_railing_door:,
        over_all_condition:,
        inside_cleaning:,
        outside_cleaning:,
        bathroom:,
        generator_area:,
        ceiling:,
        palmets:,
        over_all_condition:, 
    }
    civil_work: {
        wooden_counter_check:,
        wood_border:,
        storage_counter:,
        wall_and_ceiling:,
        paint_work:,
        tiles:,
        marbles:,
        pavers:,
        over_all_condition:,
    }
    technician_name: ,
    technician_num: ,
    remarks: '',
    photos: [],
}



-> Current complain
-> Pri maintenance

   
   class Ups{
      bool isChecked
      String title
   }
  
   IconData headerIcon
   String headerTitle
   body List<Ups>






  final String id;
  final DateTime dateTime;
  final String branch;
  final String technicianName;
  final int technicianNum;
  final String remarks;
  final List<String> photos;
  final Ups ups;
  final Generator generator;
  final Chillers chillers;
  final AirConditioner airConditoner;
  final OtherAccessories otherAccessories;
  final GlassWorkAndBranchCleaning glassWorkAndBranchCleaning;
  final CivilWork civilWork;
    

    {
        id: '23r5-uiop-89iok-0op9',
        title: 'pm',
        date_time: '12-12-2021',
        branch: 'saddar 2',
        technician_name: 'faraz ahmed',
        technician_num: '0310-3896331',
        remarks: 'abc',
        photos: 'abc.jpg',
        ups: {
            id: '23r5-uiop-89iok-0op9',
            title: 'ups',
            status: true,
            tile_list: {
                wiring_condition: 'best',
            }
        }
    }




