def tspdp(mask,pos,dp,g,n):
    if mask==(1<<n)-1:
        return g[pos][0]
    if dp[mask][pos]!=-1:
        return g[mask][pos]
    ans=float('inf')
    for i in range(n):
        if mask&(1<<i)==0:
            newans=g[pos][i] + tspdp(mask|(1<<i),i,dp,g,n)
            ans=min(ans,newans)
    dp[mask][pos]=ans
    return ans
    
def tsp(g):
    n=len(g)
    dp=[[-1]*n for _ in range(1<<n)]
    return tspdp(1,0,dp,g,n)
g = [
        [0, 10, 15, 20],
        [10, 0, 35, 25],
        [15, 35, 0, 30],
        [20, 25, 30, 0]
    ]
r=tsp(g)
print("min cost=",r)
