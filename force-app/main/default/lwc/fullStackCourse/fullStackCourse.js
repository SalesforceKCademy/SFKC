import { LightningElement } from 'lwc';

export default class FullStackCourse extends LightningElement {
    academyName = 'Salesforce KCademy';
    academyDescription = 'Platform Developer and Admin Training. A way to Master Salesforce and Get Certified';

    upcomingBatches = [
        '15th July 2024',
        '21st July 2024'
    ];

    features = [
        { id: 1, title: 'Industry-Leading Curriculum', description: 'Our course content is designed by Salesforce veterans. Experience best-in-class training tailored to current industry demands.' },
        { id: 2, title: 'Weekly Mock Interviews', description: 'Boost your confidence with regular real-world job interview practice.' },
        { id: 3, title: 'Holistic Developer Training', description: 'Dive deeper than Salesforce with training in essential tools like GitHub, Jenkins, Slack, PMD.' },
        { id: 4, title: 'Coding for Everyone', description: 'No IT background? No worries! We\'ll transform you with HTML, CSS, JavaScript, OOPs Concepts, Apex, SOQL, SOSL, Lightning Web Components (LWC).' }
    ];

    personalizedAttention = [
        { id: 1, title: '1-on-1 Doubt Clarification', description: 'Your pace is our priority.' },
        { id: 2, title: '1-on-1 Mentoring', description: 'Tailored guidance every step of the way.' }
    ];

    careerSupport = [
        { id: 1, title: 'Resume Building', description: 'Let\'s craft your impressive resume.' },
        { id: 2, title: 'Job Assistance', description: 'Tap into our industry connections to find your dream job.' }
    ];

    coursePricing = 'Starting from ₹15000 up to ₹50000.';
    contactPhone = '7013202237';
    contactEmail = 'salesforcekcademy@gmail.com';
    instagramLink = 'https://instagram.com/salesforce_kcademy?igshid=MWZjMTM2ODFkZg%3D%3D';
    youtubeLink = 'https://www.youtube.com/user/SalesforceKCademy-KC';
    demoClassLink = 'https://wa.me/917013202237';
    whatsappLink = 'https://wa.me/917013202237';
}
