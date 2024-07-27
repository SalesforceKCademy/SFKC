import { LightningElement, track, wire } from 'lwc';
import createDemoRequest from '@salesforce/apex/SFKCDemoRequestController.createDemoRequest';
import getCoursePicklistValues from '@salesforce/apex/SFKCDemoRequestController.getCoursePicklistValues';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';


export default class SFKCHomeA extends LightningElement {    
    @track isModalOpen = false;
    @track name = '';
    @track phone = '';
    @track course = '';
    @track questions = '';
    @track courseOptions = [];


    handleOpenModal() {
        this.isModalOpen = true;
    }

    handleCloseModal() {
        this.isModalOpen = false;
    }

    handleNameChange(event) {
        this.name = event.target.value;
    }

    handlePhoneChange(event) {
        this.phone = event.target.value;
    }

    handleCourseChange(event) {
        this.selectedCourse = event.detail.value;
    }

    handleQuestionsChange(event) {
        this.questions = event.target.value;
    }

    handleSubmit() {
        console.log("Handling submit");
        const fields = {
                    Name: this.name,
                    Phone__c: this.phone,
                    Course__c: this.course,
                    Questions__c: this.questions
                };
                
                console.log("fields are : ", fields);
                createDemoRequest({ fields })
                .then((result) => {
                this.isModalOpen = false;
                this.dispatchEvent(
                    new ShowToastEvent({
                        title: 'Success',
                        message: `Request submitted successfully for ${result}` ,
                        variant: 'success'
                    })
                );
                // Clear the form
                this.name = '';
                this.phone = '';
                this.course = '';
                this.questions = '';
                this.isFormVisible = false;
            })
            .catch(error => {
                console.error('Error creating demo request: ', error);
                this.dispatchEvent(
                    new ShowToastEvent({
                        title: 'Error',
                        message: 'Error in submitting request',
                        variant: 'error'
                    })
                );
            });
    }

    @wire(getCoursePicklistValues)
    wiredCourses({ error, data }) {
        if (data) {
            console.log(data);
            this.courseOptions = data.map(course => {
                return { label: course, value: course };
            });
        } else if (error) {
            this.dispatchEvent(
                new ShowToastEvent({
                    title: 'Error loading course options',
                    message: error.body.message,
                    variant: 'error'
                })
            );
        }
    }

    // showForm() {
    //     this.isFormVisible = true;
    // }

    // handleInputChange(event) {
    //     const field = event.target.dataset.id;
    //     if (field === 'name') {
    //         this.name = event.target.value;
    //     } else if (field === 'phone') {
    //         this.phone = event.target.value;
    //     } else if (field === 'course') {
    //         this.course = event.target.value;
    //     } else if (field === 'questions') {
    //         this.questions = event.target.value;
    //     }
    // }

    // handleSubmit() {
    //     const fields = {
    //         Name: this.name,
    //         Phone__c: this.phone,
    //         Course__c: this.course,
    //         Questions__c: this.questions
    //     };


    //     console.log(fields);

    //     createDemoRequest({ fields })
    //         .then(result => {
    //             this.dispatchEvent(
    //                 new ShowToastEvent({
    //                     title: 'Success',
    //                     message: 'Request submitted successfully',
    //                     variant: 'success'
    //                 })
    //             );
    //             // Clear the form
    //             this.name = '';
    //             this.phone = '';
    //             this.course = '';
    //             this.questions = '';
    //             this.isFormVisible = false;
    //         })
    //         .catch(error => {
    //             this.dispatchEvent(
    //                 new ShowToastEvent({
    //                     title: 'Error',
    //                     message: 'Error in submitting request',
    //                     variant: 'error'
    //                 })
    //             );
    //         });
    // }
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

    openDemoClassLink() {
        window.open(this.demoClassLink, '_blank');
    }

    openWhatsAppLink() {
        window.open(this.whatsappLink, '_blank');
    }
}