careerguide :-
    intro(Name),
    reset_system,
    get_interests,
    recommend_careers,
    convert_to_list(Careers),nl,
    write('Below is the list of recommended careers for you ' ),write(Name),write(' based on your interests/choices'),nl,
    display(Careers).

intro(Name) :-
    write('Welcome to M.Tech Career Advisory System!!!'),nl,
    write('I\'ll help you find best career paths for you'),nl,
    write('For each question enter your choice followed by a dot(.)'),nl,nl,
    write('Enter your name, please put full stop after it: '),
    read(Name),
    nl,
    write('Hello  '),
    write(Name),write('!!'),nl.


/*
Clear stored user progress
reset_system must return true, because retract can return either true or false
Hence we fail the first one and succeed with the second
*/
reset_system :-
    retractall(skills(_)),
    retractall(branch(_)),
    retractall(cgpa(_)),
    retractall(knows_language),
    retractall(likes(_)),
    retractall(publishedresearchpapers(_)),
    retractall(researchpapers(_)),
    fail.
reset_system.

get_interests:- 
    know_branch,
    know_marks,
    know_communication,
    know_teamwork,
    know_logical,
    know_problemsolving,
    know_programming,
    know_android,
    know_maths,
    know_statistics,
    likes_ml,
    likes_ai,
    likes_development,
    likes_vlsi,
    likes_design,
    likes_data,
    likes_higherstudies,
    likes_research,
    published_research.
    

/*getting all the information about the students interests*/

know_branch:-
    write('Enter your branch '),
    read(B),
    assert(branch(B)).

know_marks:-
    write('Enter your CGPA '),
    read(Marks),
    assert(cgpa(Marks)).

know_communication:-
    write('Do you have good communication skill? '),
    read(Y),
    Y == y, assert(skills(communication)).

know_communication.

know_teamwork:-
    write('Do you prefer working in teams? '),
    read(Y),
    Y == y, assert(skills(teamwork)).

know_teamwork.

know_logical:-
    write('Are you a person with logical thinking? '),
    read(Y),
    Y == y, assert(skills(logical)).

know_logical.

know_problemsolving:-
    write('Do you have good problem solving skills? '),
    read(Y),
    Y == y, assert(skills(problemsolving)).

know_problemsolving.

know_programming:-
    write('Do you have programming skills '),
    read(Y),
    Y == y,
    assert(skills(programming)),
    write('Do you know following languages? '),
    nl,
    append([c_plus_plus,c,python,java,sql,tableau,html,css,javascript,git,xml,vhdl],[],List),
    get_languages(List).

know_programming.

get_languages([H|T]):-
    write('Do you know '),
    write(H),
    write('? '),
    read(Y),
    Y == y -> assert(knows_language(H)),get_languages(T);
    get_languages(T).

get_languages([]).

know_android:-
    write('Do you have strong knowledge of Android SDKs? '),
    read(Y),
    Y == y,assert(skills(android_sdk)).

know_android.

know_maths:-
    write('Do you have high level knowledge in maths? '),
    read(Y),
    Y == y,assert(skills(maths)).

know_maths.

know_statistics:-
    write('Do you have good knowledge in statistics? '),
    read(Y),
    Y == y,assert(skills(statistics)).

know_statistics.

likes_ml:-
    write('Are you having interest in Machine learning field?'),
    read(Y),
    Y == y,assert(likes(ml)).

likes_ml.

likes_vlsi:-
    write('Are you having interest in VLSI?'),
    read(Y),
    Y == y,assert(likes(ml)).

likes_vlsi.

likes_data:-
    write('Are you having interest in working with data?'),
    read(Y),
    Y == y,assert(likes(data)).

likes_data.

likes_ai:-
    write('Are you having interest in Artificial Intelligence field?'),
    read(Y),
    Y == y,assert(likes(ai)).

likes_ai.

likes_development:-
    write('Are you having interest in Web/App development?'),
    read(Y),
    Y == y,assert(likes(webapp)).

likes_development.

likes_design:-
    write('Do you have interest in basic graphics designing?'),
    read(Y),
    Y == y,assert(likes(graphics)).

likes_design.

likes_higherstudies:-
    write('Are you interested in higher studies? '),
    read(Y),
    Y == y,assert(interested(higher_studies)).

likes_higherstudies.

likes_research:-
    write('Are you interested in research? '),
    read(Y),
    Y == y,assert(likes(research)).

likes_research.

published_research:-
    write('Have you ever published any research papers? '),
    read(Y),
    Y == y,assert(publishedresearchpapers(yes)),
    how_many_papers.

published_research.

how_many_papers:-
    write('How many papers have you published? '),
    read(Ans),
    assert(researchpapers(Ans)).

/*converting the recommended carees to list*/ 

convert_to_list([Car|Tail]):-
    retract(recommended(Car)),
    convert_to_list(Tail).

convert_to_list([]).

/*different types of career options*/

recommend_careers:-
    skills(maths),
    knows_language(python),
    knows_language(tableau),
    knows_language(sql),
    skills(logical),
    skills(teamwork),
    skills(communication),
    cgpa(M),
    M >= 7.5,
    likes(ml),
    likes(data),
    branch(cse),
    assert(recommended(data_analyst)),
    fail.

recommend_careers:-
    skills(maths),
    knows_language(python),
    knows_language(tableau),
    knows_language(sql),
    skills(logical),
    skills(teamwork),
    skills(communication),
    cgpa(M),
    M >= 7.5,
    likes(ml),
    likes(data),
    branch(statistics),
    assert(recommended(data_analyst)),
    fail.

recommend_careers:-
    skills(maths),
    knows_language(python),
    knows_language(sql),
    knows_language(tableau),
    skills(logical),
    skills(teamwork),
    skills(communication),
    cgpa(M),
    M >= 7.5,
    likes(ml),
    likes(data),
    branch(mathematics),
    assert(recommended(data_analyst)),
    fail.


recommend_careers:-
    skills(problemsolving),
    skills(teamwork),
    skills(communication),
    knows_language(html),
    knows_language(css),
    knows_language(javascript),
    knows_language(java),
    knows_language(sql),
    knows_language(git),
    likes(graphics),
    likes(webapp),
    cgpa(M),
    M >= 6,
    assert(recommended(web_developer)),
    fail.

recommend_careers:-
    skills(problemsolving), 
    skills(android_sdk),
    skills(teamwork),
    skills(communication),
    knows_language(xml),
    knows_language(java),
    knows_language(git),
    knows_language(sql),
    likes(graphics),
    likes(webapp),
    cgpa(M),
    M >= 6,
    assert(recommended(android_developer)),
    fail.

recommend_careers:-
    likes(ai),
    cgpa(M),
    M >= 8,
    skills(logical),
    skills(problemsolving),
    branch(cse),
    likes(research),
    assert(recommended(computer_science_and_artificial_intelligence_research)),
    fail.

recommend_careers:-
    likes(ai),
    cgpa(M),
    M >= 8,
    skills(logical),
    skills(problemsolving),
    branch(ai),
    assert(recommended(computer_science_and_artificial_intelligence_research)),
    fail.


recommend_careers:-
    skills(maths),
    skills(statistics),
    knows_language(python),
    skills(logical),
    skills(problemsolving),
    branch(cse),
    likes(data),
    likes(ml),
    cgpa(M),
    M >= 8,
    assert(recommended(machine_learning_engineer)),
    fail.

recommend_careers:-
    skills(maths),
    skills(statistics),
    knows_language(python),
    skills(logical),
    skills(problemsolving),
    branch(ai),
    likes(data),
    likes(ml),
    likes(research),
    cgpa(M),
    M >= 8,
    assert(recommended(machine_learning_engineer)),
    fail.

recommend_careers:-
    skills(communication),
    skills(problemsolving),
    publishedresearchpapers(yes),
    researchpapers(P),
    P > 1,
    cgpa(M),
    M >= 8,
    likes(research),
    interested(higher_studies),
    assert(recommended(phd)),
    fail.

recommend_careers:-
    branch(ece),
    skills(communication),
    skills(problemsolving),
    skills(teamwork),
    skills(logical),
    knows_language(vhdl),
    knows_language(c),
    knows_language(c_plus_plus),
    likes(vlsi),
    assert(recommended(vlsi_design_engineer)),  
    fail.


recommend_careers:-
    nl,nl,write('Thank you for your responses!!'),nl,nl.

/*display all the recommended careers*/
display([H|T]):-
    nl,
    write('The career recommended for you is '),write(H),nl,
    write('     Brief description about the career '),nl,
    describe(H),nl,nl,
    display(T).

display([]).


/*brief details about the careers*/

describe(data_analyst):-
    write('A data analyst is someone who scrutinises information using data analysis tools. 
The meaningful results they pull from the raw data help their employers or clients make 
important decisions by identifying various facts and trends. Typical duties include: 
using advanced computerised models to extract the data needed, removing corrupted data,
performing initial analysis to assess the quality of the data,performing final analysis 
to provide additional data screening,preparing reports based on analysis.'),nl,nl.


describe(computer_science_and_artificial_intelligence_research):-
    write('A computer science and artificial intelligence researcher’s responsibilities will 
vary greatly depending on their specialization or their particular role in the research field. 
Some may be in charge of advancing the data systems related to AI. Others might oversee the 
development of new software that can uncover new potential in the field. Others still may 
be responsible for overseeing the ethics and accountability that comes with the creation 
of such tools. No matter their specialization, however, individuals in these roles will work 
to uncover the possibilities of these technologies and then help implement changes in
existing tools to reach that potential.'),nl,nl.

describe(web_developer):-
    write('A Web Developer is responsible for the coding, design and layout of a website 
according to a company’s specifications. As the role takes into consideration user experience 
and function, a certain level of both graphic design and computer programming is necessary. 
Once a website has been created, a Web Developer will generally assist with the maintenance 
and upkeep of the website.'),nl,nl.


describe(android_developer):-
    write('Android developer responsible for the development and maintenance of applications 
aimed at a vast number of diverse Android devices. Your primary focus will be the development 
of Android applications and their integration with back-end services. You will be working 
along-side other engineers and developers working on different layers of the infrastructure. 
Therefore, commitment to collaborative problem solving, sophisticated design, and creating 
quality products is essential.'),nl,nl.


describe(machine_learning_engineer):-
    write('Machine Learning Engineers are sophisticated ML experts who specialize in designing
and building intelligent machines and systems that can learn from experience and perform 
human-like tasks with minimal or no human supervision. They create advanced ML algorithms that 
can teach computers how to perform specific tasks without being explicitly programmed for 
the same. Also, Machine Learning Engineers develop state-of-the-art ML and Deep Learning 
systems and run various ML tests and experiments to innovate unique AI-powered machines.'),nl,nl.

describe(phd):-
    write(' PhD is a globally recognized postgraduate academic degree awarded by universities 
and higher education institutions to a candidate who has submitted a thesis or dissertation, 
based on extensive and original research in their chosen field. The specificities of PhD 
degrees vary depending on where you are and what subject you’re studying. In general, 
however, the PhD is the highest level of degree a student can achieve. It usually follows 
a master’s degree, although some institutions also allow students to progress straight 
to a PhD from their bachelor’s degree. Some institutions also offer the opportunity to 
‘upgrade’ or ‘fast-track’ your master’s degree to a PhD, provided you are deemed to 
possess the necessary grades, knowledge, skills and research abilities.'),nl,nl.


describe(vlsi_design_engineer):-
    write('The individual at work designs SOC-module function
using software and design tools and as per specifications. The individual is
also responsible coordinating with other design teams involved in the SOC
design. Develop function design of module in the system-on-chip
(SOC), using software and design tools, and implement it in
coordination with other design teams in the SOC design.'),nl,nl.
