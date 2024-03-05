// income
select * from user:baher->has->transactions->contains->node where amount > 0 and is_goal is false;
// expense
select * from user:baher->has->transactions->contains->node where amount < 0 and is_goal is false;
// goal
select * from user:baher->has->transactions->contains->node where is_goal;
// manule filter
select * from user:baher->has->transactions->contains->node;
