using System;
public class Judger : IComparable<Judger>
{
    public int pid;
    public int seq;

    // Default comparer for Part type.
    public int CompareTo(Judger compareJudger)
    {
        // A null value means that this object is greater.
        if (compareJudger == null)
            return 1;

        else
            return this.seq.CompareTo(compareJudger.seq);
    }

}