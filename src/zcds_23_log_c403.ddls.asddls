@AccessControl.authorizationCheck: #NOT_ALLOWED
define hierarchy zcds_23_log_c403
  as parent child hierarchy (
    source zcds_22_log_c403
    child to parent association _Manager
    start where Manager is initial
    siblings order by Employee
    multiple parents allowed
    orphans ignore
    cycles breakup cache on 
  )
{
    key Employee,
    Manager,
    Name,
    $node.parent_id as ParentID,
    $node.node_id as NodeID,
    $node.hierarchy_is_cycle as HIsCycle,
    $node.hierarchy_is_orphan as HisOrphan,
    $node.hierarchy_level as HLevel,
    $node.hierarchy_parent_rank as HParentRank,
    $node.hierarchy_rank as Hrank,
    $node.hierarchy_tree_size as HTreeSize
}
