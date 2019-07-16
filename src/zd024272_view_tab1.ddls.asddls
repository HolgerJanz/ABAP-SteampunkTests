@AbapCatalog.sqlViewName: 'ZD024272VTAB1'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'View for ZD024272_TAB1'
define view ZD024272_VIEW_TAB1 as select from zd024272_tab1 {
  key key1,
  key key2   
}
