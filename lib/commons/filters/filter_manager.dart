// import 'package:d2_remote/core/mp/enrollment/enrollment_status.dart';
// import 'package:d2_remote/modules/activity_management/activity/entities/activity.entity.dart';
// import 'package:d2_remote/modules/metadata/organisation_unit/entities/organisation_unit.entity.dart';

// import '../../core/common/state.dart';
// import '../../core/event/event_status.dart';
// import 'sorting/sorting_item.dart';

// /// Serializable
// class FilterManager {
//     /// ObservableField
//     final int periodIdSelected;// = new ObservableField<>(R.id.anytime);
//     /// ObservableField
//     final int enrollmentPeriodIdSelected;// = new ObservableField<>(R.id.anytime);

//     //  CatOptCombFilterAdapter catComboAdapter;

//     List<Activity> activityFilters;

//     List<OrganisationUnit> ouFilters;

//     List<State> stateFilters;
//     // List<DatePeriod> periodFilters;
//     // List<DatePeriod> enrollmentPeriodFilters;
//     // List<CategoryOptionCombo> catOptComboFilters;
//     List<EventStatus> eventStatusFilters;
//     bool assignedFilter;

//     SortingItem sortingItem;
//     bool followUpFilter;

//     List<String> stateValues = [];
//     List<EnrollmentStatus> enrollmentStatusFilters;
    
//     /// MutableLiveData
//      MutableLiveData<List<OrganisationUnit>> liveDataOUFilter = new MutableLiveData<>();


//     /// MutableLiveData
//      MutableLiveData<List<State>> observableStates = new MutableLiveData<>();
    

//     /// ObservableField
//      ObservableField<List<DatePeriod>> observablePeriodFilters = new ObservableField<>();

//     /// ObservableField
//      ObservableField<InternalError> observablePeriodId = new ObservableField<>();
    

//     /// ObservableField
//      ObservableField<List<EventStatus>> observableEventStatus = new ObservableField<>();
     

//     /// ObservableField
//      ObservableField<EnrollmentStatus> observableEnrollmentStatus = new ObservableField<>();
    

//     /// ObservableField
//      ObservableField<Boolean> observableAssignedToMe = new ObservableField<>();
    

//     /// ObservableField
//      ObservableField<Boolean> observableFollowUp = new ObservableField<>();

//      ArrayList<Filters> unsupportedFilters = new ArrayList<>();

//     /// ObservableField
//     final int ouFiltersApplied;
//     /// ObservableField
//     final int stateFiltersApplied;
//     /// ObservableField
//     final int periodFiltersApplied;
//     /// ObservableField
//     final int enrollmentPeriodFiltersApplied;
//     /// ObservableField
//     final int catOptCombFiltersApplied;
//     /// ObservableField
//     final int eventStatusFiltersApplied;
//     /// ObservableField
//     final int enrollmentStatusFiltersApplied;
//     /// ObservableField
//     final int assignedToMeApplied;
//     /// ObservableField
//     final int followUpFilterApplied;


//     /// ObservableField
//      ObservableField<WorkingListScope> currentWorkingListScope = new ObservableField<>(
//             new EmptyWorkingList()
//     );

//      FlowableProcessor<FilterManager> filterProcessor;
//      FlowableProcessor<Boolean> ouTreeProcessor;
//      FlowableProcessor<Pair<PeriodRequest, Filters>> periodRequestProcessor;
//      FlowableProcessor<String> catOptComboRequestProcessor;

//      WorkingListItem currentWorkingList;

//      ResourceManager resourceManager;

//      static FilterManager instance;
// }
