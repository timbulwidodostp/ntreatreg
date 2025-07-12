{smcl}
{* 01sep2014}{...}
{cmd:help ntreatreg}{right: ({browse "http://www.stata-journal.com/article.html?article=st0499":SJ17-4: st0499})}
{hline}

{title:Title}

{p2colset 5 18 20 2}{...}
{p2col :{hi:ntreatreg} {hline 2}}Command for estimation of treatment effects in the presence of correlated neighborhood interactions{p_end}
{p2colreset}{...}


{title:Syntax}

{p 8 17 2}
{cmd:ntreatreg}
{it:outcome} 
{it:treatment}
[{it:varlist}]
{ifin}
{weight}{cmd:,} {cmd:spill}{cmd:(}{it:matrix}{cmd:)}
[{cmd:hetero}{cmd:(}{it:varlist_h}{cmd:)}
{cmd:conf}{cmd:(}{it:#}{cmd:)}
{cmd:graphic}
{cmd:save_graph}{cmd:(}{it:filename}{cmd:)}
{cmd:vce(robust)}
{cmd:const(noconstant)}
{cmd:head(noheader)} {cmd:beta}]

{pstd}
{cmd:fweight}s, {cmd:iweight}s, and {cmd:pweight}s are allowed;
see {help weight}.


{title:Description}

{pstd}
{cmd:ntreatreg} estimates average treatment effects (ATEs) under conditional
mean independence when correlated neighborhood interactions may be present.
It incorporates such externalities within the traditional Rubin potential
outcome model.  As such, it provides an attempt to relax the stable unit
treatment-value assumption generally assumed in observational studies.

     
{title:Options}
    
{phang}
{cmd:spill}{cmd:(}{it:matrix}{cmd:)} specifies the adjacent (weighted) matrix
used to define the presence and strength of the units' relationships.  It
could be a distance matrix, with distance loosely defined as either vector or
spatial.  {cmd:spill()} is required.

{phang}
{cmd:hetero}{cmd:(}{it:varlist_h}{cmd:)} specifies the variables over which
one calculates the idiosyncratic ATE(x), average treatment effect on treated
[ATET(x)], and average treatment effect on nontreated [ATENT(x)], where
x={it:varlist_h}.  The default is that the command fits the specified model
without a heterogeneous average effect.  {it:varlist_h} should be the same set
or a subset of the variables specified in {it:varlist}.

{phang}
{opt conf(#)} sets the confidence level equal to the number specified by the
user.  The default is {cmd:conf(95)}.

{phang}
{cmd:graphic} requests a graphical representation of the density distributions
of ATE(x), ATET(x), and ATENT(x).  It gives an outcome only if variables are
specified in {cmd:hetero()}.

{phang}
{cmd:save_graph}{cmd:(}{it:filename}{cmd:)} saves in {it:filename} the graph
obtained with the option {cmd:graphic}.

{phang}
{cmd:vce(robust)} allows for robust regression standard errors.

{phang}
{cmd:const(noconstant)} suppresses the regression constant term.

{phang}
{cmd:head(noheader)} suppresses the header.

{phang}
{cmd:beta} reports standardized beta coefficients.


{title:Remarks}

{pstd}
{cmd:ntreatreg} creates the following variables:

{pmore}
{cmd:_ws_}{it:varname_h} is an additional regressor used in the model's
regression when the option {cmd:hetero()} is specified.

{pmore}
{cmd:_z_}{it:varname_h} is a spillover additional regressor.

{pmore}
{cmd:_v_}{it:varname_h} is the first spillover component of
{cmd:_z_}{it:varname_h}.

{pmore}
{cmd:_ws_v_}{it:varname_h} is the second spillover component of
{cmd:_z_}{it:varname_h}.

{pmore}
{cmd:ATE_x} is an estimate of the idiosyncratic ATE given x.

{pmore}
{cmd:ATET_x} is an estimate of the idiosyncratic ATET given x.

{pmore}
{cmd:ATENT_x} is an estimate of the idiosyncratic ATENT given x.

{pstd}
The treatment must be a 0/1 binary variable ({cmd:1} = treated, {cmd:0} = untreated).

{pstd}
When the matrix of interactions is provided in the option {cmd:spill()},
ensure that it has been sorted in such a way as to have first the treated
units and then the untreated units, both by row and by column.  See the
tutorial in the references.

{pstd}
When the option {cmd:hetero()} is not specified, then ATE(x), ATET(x), and
ATENT(x) are one singleton number equal to ATE=ATET=ATENT.

{pstd}
Please remember to use the {cmdab:update query} command before running this
program to make sure you have an up-to-date version of Stata installed.


{title:Example}

{phang}
{cmd:. ntreatreg y w x1 x2, hetero(x1 x2) spill(omega) graphic}


{title:Stored results}

{pstd}
{cmd:ntreatreg} stores the following in {cmd:e()}:

{synoptset 15 tabbed}{...}
{p2col 5 15 19 2: Scalars}{p_end}
{synopt :{cmd:e(N_tot)}}total number of (used) observations{p_end}
{synopt :{cmd:e(N_treat)}}number of (used) treated units{p_end}
{synopt :{cmd:e(N_untreat)}}number of (used) untreated units{p_end}
{synopt :{cmd:e(ate)}}value of the ATE{p_end}
{synopt :{cmd:e(atet)}}value of the ATET{p_end}
{synopt :{cmd:e(atent)}}value of the ATENT{p_end}


{title:Acknowledgments}

{pstd} 
An early version of this routine was presented at CEMMAP (Centre for Microdata
Methods and Practice), University College London, on 27 March 2013.  The
author wishes to thank all the seminar participants and in particular Richard
Blundell, Andrew Chesher, Charles Manski, Adam Rosen, and Barbara Sianesi for
the useful discussion.  A more developed version was presented at the
Department of Economics, Boston College, on 12 November 2013.  The author
wishes to thank all the seminar participants and in particular Kit Baum,
Andrew Beauchamp, Rossella Calvi, Federico Mantovanelli, Scott Fulford, and
Mathis Wagner for their participation and suggestions.


{title:Author}

{pstd}Giovanni Cerulli{p_end}
{pstd}IRCrES-CNR{p_end}
{pstd}National Research Council of Italy{p_end}
{pstd}Research Institute for Sustainable Economic Growth{p_end}
{pstd}Rome, Italy{p_end}
{pstd}{browse "mailto:giovanni.cerulli@ircres.cnr.it":giovanni.cerulli@ircres.cnr.it}{p_end}


{title:Also see}

{p 4 14 2}Article:  {it:Stata Journal}, volume 17, number 4: {browse "http://www.stata-journal.com/article.html?article=st0499":st0499}{p_end}

{p 7 14 2}
Help:  {manhelp etregress TE}, {manhelp ivregress R}, {helpb pscore}, {helpb psmatch2}, {helpb nnmatch}, {helpb ivtreatreg}, {helpb treatrew} (if installed){p_end}
